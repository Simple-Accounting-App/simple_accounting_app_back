# A GraphQL-Rail-React simple accounting app - back side

This project aims at building a simple GraphQL API with RubyOnRails. :smile:

Here was the brief:
- You are working on a minimalist accounting software. Your task is to write a small web application that exposes a GraphQL API and allows users to interact with different entities.
- Key features to implement:
  - The user must be able to create a new accounting transaction and to see all the existing ones
  - At any time, we should be able to know what is the current balance of any account
- Characteristics of an accounting transaction: Debit Account, Credit Account, Date, Amount


## Stack and requirements :brain:

### Stack

- RubyOnRails:  Back-end framework :click:
- GraphQL:      API framework
- Rspec:        Testing framework

### Requirements 

- Ruby: 3.1.2
- Rails: 6.1.7
- Node.js: v19.0.0
- Yarn: 1.22.19
- Bundler: 2.3.24

## How to launch app :mechanical_arm:

- Clone project
- Go to project folder: `cd simple_accounting_app_back/`
- Create database and add seeds: `rails db:create db:seed`
- Launch app: `rails server --port=5000`
- Open browser and go to: `http://localhost:5000/graphiql`

## How to test app :test_tube:

- Clone project
- Go to project folder: `cd simple_accounting_app_back/`
- Run tests: `rspec spec/`
- Bonus: To run linter: `rubocop`

## Preview :film_strip:

[Link to preview GraphQL API](https://drive.google.com/file/d/1Yy2T9UwZ_gkJ9SQRmhABTD7-n1bMuiPT/view?usp=sharing)
