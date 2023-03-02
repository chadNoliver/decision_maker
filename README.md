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
- [X] Add initial annotations
- [X] Random selection  
- [X] Animations for random selection  
- [ ] Actual users/usernames  
- [ ] Multiple cursors/evidence of multiple users  
- [ ] Multiple Stages of random selection  
- [ ] Home screen
- [ ] Github Actions for testing 
- [ ] Multiple channels for users to have private channels/topics 
- [ ] Basic text chat feature
- [ ] Distribute through Fly.io   

## Annotations  
These annotations are derived from the following `hexdocs` and tailored for 
this repository:  
  - https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html
  - https://hexdocs.pm/phoenix/1.7.0-rc.0/overview.html 

```tree
tree -I '_build|deps|priv|test'

 .
├── README.md   //You are here 
├── _build      //Compilation artifacts
├── assets      //Source code for front-end assets, bundled by `esbuild` tool
│   ├── css
│   │   └── app.css
│   ├── js
│   │   └── app.js
│   ├── tailwind.config.js
│   └── vendor
│       └── topbar.js
├── config            //Project configuration
│   ├── config.exs    //Entry point for configuration, imports rest of configs
│   ├── dev.exs       //Dev environment specific config
│   ├── prod.exs      //Prod environment specific config
│   ├── runtime.exs   //Last executed, best for read secrets/dynamic config 
│   └── test.exs      //Test environment specific config
├── deps              //Mix dependencies (listed in `mix.exs` `defp deps do`)
├── lib                             //Application source code
│   ├── decision_maker              //MVC Model
│   │   ├── application.ex          //Starts db, pubsub, etc
│   │   ├── choice_table   
│   │   │   └── choice.ex
│   │   ├── choice_table.ex
│   │   ├── mailer.ex               //For sending emails - unused 
│   │   ├── random.ex
│   │   └── repo.ex                 //Main intercface to database
│   ├── decision_maker.ex
│   ├── decision_maker_web          //MVC View & Controller
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
│   │   ├── endpoint.ex           //Entry point for HTTP request leads to router
│   │   ├── gettext.ex            //For internationalization of text, unused
│   │   ├── live
│   │   │   └── choice_live
│   │   │       ├── form_component.ex
│   │   │       ├── index.ex
│   │   │       ├── index.html.heex
│   │   │       ├── show.ex
│   │   │       └── show.html.heex
│   │   ├── router.ex           //Rules to dispatch requests to controllers
│   │   └── telemetry.ex        //Defines telemetry supervisor
│   └── decision_maker_web.ex
├── logs
├── mix.exs
├── mix.lock
├── priv  //Production resources, but not source code (images, db scripts)
└── test  //Applicatoin tests (mirrors `./lib`)
 
```
### Notes
  - Router maps unique HTTP verb/path pairs to controller action pairs.  
  - Controllers - elixir modules; actions - `/2` functions defined within them
  - 
## Running
### Requirements
    - hex
    - elixir >= 14+
    - erlang   
    - postgres

### Set your postgres password
    - For example dev password in `./config/dev.exs` is defaulted to username `postgres` and password `postgres`

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
