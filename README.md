# DecisionMaker

## Description   
This is a Phoenix Web App designed to make decisions for users.  It will 
allow multiple users to view and edit choices for a decision concurrently.  It 
will then allow users to participate in the random selection of one of these 
choices.    
Phoenix is chosen as a framework in order to explore the ease of concurrent 
connections using live view.  This will allow users to collaborate while making 
options and participating in the random selection of the final decision.

## ToDo

- [x] Postgres  
- [x] CRUD  
- [x] PubSub  
- [ ] Random selection  
- [ ] Actual users/usernames  
- [ ] Multiple cursors/evidence of multiple users  
- [ ] Multiple Stages of random selection  
- [ ] Animations for random selection  
- [ ] Distribute through Fly.io   
- [ ] Github Actions for easy deployment

## Running
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
