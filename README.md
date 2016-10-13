#Rate-A-Date 

![Build Status](https://codeship.com/projects/6c866a60-6ba7-0134-54fc-2e8398cca30e/status?branch=master)
![Code Climate](https://codeclimate.com/github/dkkahn10/group-project-reviews.png)
[![Coverage Status](https://coveralls.io/repos/github/dkkahn10/group-project-reviews/badge.svg)](https://coveralls.io/github/dkkahn10/group-project-reviews)

Rate-A-Date is a review site built with Ruby on Rails. This application was designed for the purpose of rating potential date locations.  We allow users to add new locations, reviews and ratings. It comes included with a built in voting feature to “upvote” and “downvote” reviews. 

[Rate-A-Date Heroku Link](https://rate-a-date.herokuapp.com/)

##Built by:
*	[Jason Almeida](https://github.com/Cyril-Jay)
*	[Mary Elaine Mahaffey](https://github.com/mmahaff)
*	[Dustin Kahn](https://github.com/dkkahn10)
*	[Amanda Beiner](https://github.com/amandabeiner)


##Functionality: 
*	Users may sign up/sign in to an account 
*	Users may add a new location with a description and name 
*	Users may review a location of their choosing and rate locations based on intimacy 
*	Users may upvote and downvote individual reviews
*	Users may update locations and reviews they created
*	Admins can remove any content while users can only remove content of their creation


##Technologies: 
*	Created with Ruby on Rails
*	[Devise](https://github.com/plataformatec/devise) used for user authentication/authorization
*	[Carrierwave](https://github.com/carrierwaveuploader/carrierwave) and [Fog](https://github.com/fog/fog) used for image upload along with [Amazon S3](https://aws.amazon.com/s3/?sc_channel=PS&sc_campaign=acquisition_US&sc_publisher=google&sc_medium=s3_b&sc_content=s3_e&sc_detail=amazon%20s3&sc_category=s3&sc_segment=105589467882&sc_matchtype=e&sc_country=US&s_kwcid=AL!4422!3!105589467882!e!!g!!amazon%20s3&ef_id=VzNZ8QAAABvDKM8r:20161013191944:s) image hosting
*	[Foundation](https://github.com/zurb/foundation-rails) gem for stylization
*	Deployment on [Heroku](http://heroku.com/)
*	Voting feature constructed with Ajax
*	[Capybara](http://jnicklas.github.io/capybara/) used for Feature testing 
*	[RSPEC](https://github.com/rspec/rspec) used for Model testing
