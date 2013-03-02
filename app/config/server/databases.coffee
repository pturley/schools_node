module.exports =
  mongodb:
    development:
      name: 'schools-node-development'
      port: 27017
      host: '127.0.0.1'
    test:
      name: 'schools-node-test'
      port: 27017
      host: '127.0.0.1'
    staging:
      name: 'schools-node-staging'
      port: 27017
      host: '127.0.0.1'
    production:
      name: 'schools-node-production'
      port: 27017
      host: '127.0.0.1'
      # for heroku, comment out name/port/host above and just use `url`:
      #
      #   url: process.env.MONGOHQ_URL
      # 
      # then make sure you have the mongohq heroku addon:
      #   
      #   heroku addons:add mongohq:free

  redis:
    development:
      name: 'schools-node-development'
      port: 6397
      host: '127.0.0.1'
    test:
      name: 'schools-node-test'
      port: 6397
      host: '127.0.0.1'
    staging:
      name: 'schools-node-staging'
      port: 6397
      host: '127.0.0.1'
    production:
      name: 'schools-node-production'
      port: 6397
      host: '127.0.0.1'
