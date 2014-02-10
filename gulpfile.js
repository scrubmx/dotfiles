var gulp       = require('gulp'),
    less       = require('gulp-less'),
    minifycss  = require('gulp-minify-css'),
    notify     = require('gulp-notify'),
    jshint     = require('gulp-jshint'),
    stylish    = require('jshint-stylish'),
    uglify     = require('gulp-uglify'),
    rename     = require('gulp-rename'),
    livereload = require('gulp-livereload');


// Minify and compile all LESS files
gulp.task('less', function () {
    return gulp.src('public/css/**/*.less')
        .pipe(less())
        .pipe(minifycss({'keepBreaks':true}))
        .pipe(gulp.dest('public/css/'))
        .pipe(livereload())
        .pipe(notify({ message: 'Compile less to css files completed.' }));
});

// Lint and minify javascript functions.js file
gulp.task('lint', function () {
    return gulp.src('public/js/functions.js')
        .pipe(jshint())
        .pipe(jshint.reporter(stylish))
        .pipe(jshint.reporter('fail'))
        .pipe(uglify())
        .pipe(rename('functions.min.js'))
        .pipe(gulp.dest('public/js/'));
});

// Rerun the tasks when a file changes
gulp.task('watch', function () {
    
    var server = livereload();
    
    gulp.watch('app/**/*.php', function(evt) {
        server.changed(evt.path);
    });
    
    gulp.watch('public/css/**/*.less', ['less']);
    gulp.watch('public/js/functions.js', ['lint']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['less', 'lint', 'watch']);
