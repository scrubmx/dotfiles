var gulp      = require('gulp'),
    less      = require('gulp-less'),
    minifycss = require('gulp-minify-css'),
    notify    = require('gulp-notify'),
    jshint    = require('gulp-jshint'),
    stylish   = require('jshint-stylish');

// Minify and compile all LESS files
gulp.task('less', function () {
    return gulp.src('public/css/**/*.less')
      .pipe(less())
      .pipe(minifycss({'keepBreaks':true}))
      .pipe(gulp.dest('public/css/'))
      .pipe(notify({ message: 'Compile less to css files completed.' }));
});

gulp.task('lint', function () {
    return gulp.src('public/js/functions.js')
      .pipe(jshint())
      .pipe(jshint.reporter(stylish));
});

// Rerun the task when a file changes
gulp.task('watch', function () {
  gulp.watch('public/css/**/*.less', ['less']);
  gulp.watch('public/js/functions.js', ['lint']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['less', 'lint', 'watch']);
