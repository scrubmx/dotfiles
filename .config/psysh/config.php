<?php

/*
|--------------------------------------------------------------------------
| PsySH Configuration
|--------------------------------------------------------------------------
|
| Just add this file in ~/.config/psysh/config.php
| @see http://psysh.org/#configuration
|
*/

if (! defined('LARAVEL_START')) {
    $__psysh__config = [];

    // Check if an autoload file exists
    if (file_exists($__psysh_autoload_path = getcwd().'/vendor/autoload.php')) {
        $__psysh__config['defaultIncludes'][] = $__psysh_autoload_path;
    }

    // Return early since we are not working with a Laravel app
    return $__psysh__config;
}

/*
|--------------------------------------------------------------------------
| Laravel Specific Configs
|--------------------------------------------------------------------------
*/

use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\DB;
use Psy\Command\Command;
use Psy\VarDumper\Presenter;
use Psy\VarDumper\PresenterAware;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

// https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
if (! defined('ANSI_COLORS_FG')) {
    define('ANSI_COLORS_FG', [
        'black' => 30,
        'red' => 31,
        'green' => 32,
        'yellow' => 33,
        'blue' => 34,
        'magenta' => 35,
        'cyan' => 36,
        'white' => 37,
        'bright_black' => 90,
        'bright_red' => 91,
        'bright_green' => 92,
        'bright_yellow' => 93,
        'bright_blue' => 94,
        'bright_magenta' => 95,
        'bright_cyan' => 96,
        'bright_white' => 97,
    ]);
}

/*
|--------------------------------------------------------------------------
| Global Helpers
|--------------------------------------------------------------------------
*/

if (! function_exists('__laravel_query_caster')) {
    function __laravel_query_caster(Illuminate\Database\Query\Builder|Illuminate\Database\Eloquent\Builder $query): array
    {
        $query = $query instanceof Illuminate\Database\Eloquent\Builder ? $query->getQuery() : $query;

        return [
            'sql' => $query->toSql(),
            'bindings' => $query->getBindings(),
            'raw' => __laravel_raw_sql($query->toSql(), $query->getBindings()),
        ];
    }
}

if (! function_exists('__laravel_raw_sql')) {
    function __laravel_raw_sql(string $sql, array $bindings = []): string
    {
        // https://www.php.net/manual/en/reference.pcre.pattern.modifiers.php

        // TODO: Coment out the regex like this:
        // https://github.com/datacreativa/circulo-plus/blob/25ec93110247f1dc8cd66074a5323edfd062361f/app/Billing/Sanborns/ChargeResource.php#L28-L38
        $pattern = "/(?![^`][\w\.-]*[`]) (?![^\((\"|')][\w-]*[(\"|')\)]) [\w\.]+/mx";

        $bindings = collect($bindings)->map(fn ($binding) => match (true) {
            is_numeric($binding) => $binding,
            is_string($binding) => "'$binding'",
            $binding instanceof DateTime => "'{$binding->toDateTimeString()}'",
            default => $binding,
        });

        return str($sql)
            ->replaceMatches($pattern, fn (array $matches): string => mb_strtoupper($matches[0]))
            ->replaceArray('?', $bindings->toArray())
            ->value();
    }
}

if (!function_exists('__psysh_alias')) {
    function __psysh_alias(string $fqn, ?string $alias = null): void
    {
        if (class_exists($fqn) && ! class_exists($alias ??= class_basename($fqn))) {
            class_alias($fqn, $alias, autoload: true);
        }
    }
}

if (! function_exists('__psysh_print')) {
    function __psysh_print(string $message = '', string $color = 'white'): void
    {
        $code = ANSI_COLORS_FG[$color] ?? 0;

        echo "\033[{$code}m{$message}\033[0m", PHP_EOL;
    }
}

if (! function_exists('tomorrow')) {
    function tomorrow(DateTimeZone|string|null $tz = null): Carbon
    {
        return Date::tomorrow($tz);
    }
}

/*
|--------------------------------------------------------------------------
| Class Aliases
|--------------------------------------------------------------------------
*/

__psysh_alias(App\Models\User::class);
__psysh_alias(App\Models\Claim::class);
__psysh_alias(App\Models\Company::class);
__psysh_alias(Illuminate\Support\Carbon::class);
__psysh_alias(Illuminate\Support\Collection::class);

/*
|--------------------------------------------------------------------------
| Queries
|--------------------------------------------------------------------------
*/

// DB::enableQueryLog();

// DB::listen(function (Illuminate\Database\Events\QueryExecuted $query) {
//     $sql = __laravel_raw_sql($query->sql, $query->bindings);

//     __psysh_print("({$query->time}ms) {$sql}", 'magenta');
// });

/*
|--------------------------------------------------------------------------
| PsySh Configs
|--------------------------------------------------------------------------
*/

return [

    'casters' => [

        \Illuminate\Database\Query\Builder::class => '__laravel_query_caster',
        \Illuminate\Database\Eloquent\Builder::class => '__laravel_query_caster',

    ],

    'commands' => [

        // Get the laravel query log.
        'query:log' => new class('query:log') extends Command implements PresenterAware
        {
            public function run(InputInterface $input, OutputInterface $output): int
            {
                // TODO: display only the "raw" query and the time.
                $output->page($this->presenter->present(DB::getQueryLog()));

                return 0;
            }

            public function setPresenter(Presenter $presenter)
            {
                $this->presenter = $presenter;
            }
        },

        // Get the last executed query.
        'query:last' => new class('query:last') extends Command implements PresenterAware
        {
            public function run(InputInterface $input, OutputInterface $output): int
            {
                // TODO: display only the "raw" query and the time.
                $output->page($this->presenter->present(last(DB::getQueryLog())));

                return 0;
            }

            public function setPresenter(Presenter $presenter)
            {
                $this->presenter = $presenter;
            }
        },

        'query:clear' => new class('query:clear') extends Command
        {
            public function run(InputInterface $input, OutputInterface $output): int
            {
                DB::flushQueryLog();

                return 0;
            }
        }

    ],
];
