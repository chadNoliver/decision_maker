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
- [ ] Add initial annotations
- [ ] Random selection  
- [ ] Actual users/usernames  
- [ ] Multiple cursors/evidence of multiple users  
- [ ] Multiple Stages of random selection  
- [ ] Animations for random selection  
- [ ] Distribute through Fly.io   
- [ ] Github Actions for easy deployment

## Annotations  
These annotations are derived from the following `hexdocs` and tailored for 
this repository:  
  - https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html
  - https://hexdocs.pm/phoenix/1.7.0-rc.0/overview.html 

```tree
tree -I '_build|deps|priv|test'

 .
├── README.md                              //You are here 
├── _build                                 //
├── assets
│   ├── css
│   │   └── app.css
│   ├── js
│   │   └── app.js
│   ├── tailwind.config.js
│   └── vendor
│       └── topbar.js
├── config
│   ├── config.exs
│   ├── dev.exs
│   ├── prod.exs
│   ├── runtime.exs
│   └── test.exs
├── deps
├── lib
│   ├── decision_maker
│   │   ├── application.ex
│   │   ├── choice_table
│   │   │   └── choice.ex
│   │   ├── choice_table.ex
│   │   ├── mailer.ex
│   │   ├── random.ex
│   │   └── repo.ex
│   ├── decision_maker.ex
│   ├── decision_maker_web
│   │   ├── components
│   │   │   ├── core_components.ex
│   │   │   ├── layouts
│   │   │   │   ├── app.html.heex
│   │   │   │   └── root.html.heex
│   │   │   └── layouts.ex
│   │   ├── controllers
│   │   │   ├── error_html.ex
│   │   │   ├── error_json.ex
│   │   │   ├── page_controller.ex
│   │   │   ├── page_html
│   │   │   │   └── home.html.heex
│   │   │   └── page_html.ex
│   │   ├── endpoint.ex
│   │   ├── gettext.ex
│   │   ├── live
│   │   │   └── choice_live
│   │   │       ├── form_component.ex
│   │   │       ├── index.ex
│   │   │       ├── index.html.heex
│   │   │       ├── show.ex
│   │   │       └── show.html.heex
│   │   ├── router.ex
│   │   └── telemetry.ex
│   └── decision_maker_web.ex
├── logs
├── mix.exs
├── mix.lock
├── priv                                     //TODO
└── test                                     //TODO
   
 
```

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
