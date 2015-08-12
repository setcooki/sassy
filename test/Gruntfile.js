module.exports = function(grunt)
{
    grunt.initConfig({
        pkg: grunt.file.readJSON("package.json"),
        compass: {
            dist: {
                options: {
                    load: 'bower_components/sassy',
                    importPath: [
                        'bower_components/foundation/scss',
                        'bower_components/sassy/scss'
                    ],
                    imagesPath: 'bower_components/sassy/img',
                    sassDir: 'test/scss',
                    cssDir: 'test'
                }
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
};