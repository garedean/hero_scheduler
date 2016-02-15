# Hero Scheduler

The purpose of this application is to store and display the on-duty schedule for a team. The 'Support Hero' is the team member providing heroic custom support on a given day.

# Setup in Local Environment

1. Clone the repository to your local machine. In a terminal, navigate to the repository directory
2. In terminal, run "bundle" to install project dependencies
3. In terminal, run "rake db:create", then run "rake db:migrate" to set up the database
4. In terminal, run "rake db:seed" to seed the database with initial data
5. In terminal, run "rails s" to start the rails server
6. In browser, navigate to http://localhost:3000/ to view the site

# Features

  - Displays today’s Support Hero
  - Displays a single user’s schedule showing the days they are assigned to Support Hero
  - Display the full schedule for all users in the current month.
  - Users are be to mark one of their days on duty as undoable. The system reschedules accordingly
  - Takes into account weekends and California’s holidays making sure not to schedule team members on those days
  - Users are able to swap duty with another user’s specific day
