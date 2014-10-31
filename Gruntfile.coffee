module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'bootstrap-growl.js': 'bootstrap-growl.coffee'

    uglify:
      minify:
        files:
          'bootstrap-growl.min.js': 'bootstrap-growl.js'

    watch:
      files: 'bootstrap-growl.coffee'
      tasks: ['coffee', 'uglify']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee', 'uglify']
