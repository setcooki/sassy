module.exports = function(grunt)
{
    grunt.initConfig({
        pkg: grunt.file.readJSON("package.json"),
        compass: {
            dist: {
                options: {
                    load: '../',
                    importPath: [
                        'bower_components/foundation/scss',
                        '../scss'
                    ],
                    imagesPath: '../img',
                    sassDir: 'test/scss',
                    cssDir: 'test',
                    trace: true,
                    debugInfo: false
                }
            }
        },
        watch: {
            options: {
                spawn: false,
                interrupt: true,
                interval: 2000
            },
            css: {
                files: [
                    'test/*.scss',
                    'test/**/*.scss',
                    '../scss/*.scss',
                    '../scss/**/*.scss'
                ],
                tasks: ['compass']
            }
        }
    });

    grunt.loadNpmTasks("grunt-contrib-concat");
    grunt.loadNpmTasks("grunt-contrib-uglify");
    grunt.loadNpmTasks("grunt-contrib-watch");
    grunt.loadNpmTasks("grunt-contrib-sass");
    grunt.loadNpmTasks("grunt-contrib-cssmin");
    grunt.loadNpmTasks("grunt-contrib-copy");
    grunt.loadNpmTasks("grunt-contrib-jshint");
    grunt.loadNpmTasks("grunt-contrib-compass");
    grunt.loadNpmTasks("grunt-modernizr");

    grunt.registerTask("build", ["compass"]);
    grunt.registerTask("live", ["watch"]);
};