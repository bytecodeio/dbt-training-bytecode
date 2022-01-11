# Bytecode dbt Training Getting Started Doc

### Using the starter project

Try running the following commands:
- `dbt run`
- `dbt test`


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


## Using DBT in CLI

dbt is versatile in the way in which you interact with it. Many of you, so far, have used the Cloud version of dbt which provides a web-based interface. But you can also run dbt locally on your computer using your IDE of choice and executing commands via the command line in your terminal.

### Choosing an IDE

Since the package for the dbt CLI is a python package, I use [Pycharm Professional](https://www.jetbrains.com/pycharm) from Jetbrains to run my dbt instances locally. But this isn't free so I wouldn't recommend using it unless you _REALLY_ like it. There is a free community version of Pycharm that has fewer features that you can find [here.](https://www.jetbrains.com/pycharm/download/#section=mac) Here are some really great (and free) IDEs to use as well:

- [Microsoft Visual Studio Code](https://code.visualstudio.com) - Probably my second most preferred IDE. Has a lot of great functionality
- [Atom](https://atom.io)
- [Spyder](https://www.spyder-ide.org/)
- [Sublime Text](https://www.sublimetext.com/) - Can evaluate for free but will need to buy a license for continued use


### Setting up dbt CLI

1. Install DBT CLI via PIP (recommended for Windows or Linux) - [PIP DBT Installation](https://docs.getdbt.com/dbt-cli/install/pip) or Homebrew (recommended for MacOS) - [Homebrew CLI Installation](https://docs.getdbt.com/dbt-cli/installation)
2. The project is already created in `dbt_project.yml`, you don't need to reconfigure it, but you will need a `profiles.yml` file in your `~/.dbt/` folder, as described [here](https://docs.getdbt.com/dbt-cli/configure-your-profile). An example Profile config can be found below. You will need to fill in the account, user and password of our Snowflake instance.
Please remember that the `account` is not only the Snowflake account number, but also the Amazon Region, as in `abc-123456.us-east-2`.
3. Configure your IDE / CLI autocompletion as described [here](https://discourse.getdbt.com/t/how-we-set-up-our-computers-for-working-on-dbt-projects/243).
4. Connect your IDE to VCS/Github and pull in the source code.
5. Run `dbt deps` to install all needed packages.
6. Now `dbt list` will list all the resources available in this project.
7. Run `dbt seed` to seed the project (if you are utilizing seeds).
8. `dbt run` should work now.

After the initial installation, you will be able to activate the project with:
1. `cd dbt-<your_org>`
2. `source dbt-env/bin/activate`

### Example Profile Config 

In `~/.dbt/profiles.yml`:
```
bytecode:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: [enter account]
      user: [enter username]
      password: [enter password]
      role: 
      database: TRAINING_DB_[YOUR_NAME]
      warehouse: TRAINING_WH_[YOUR_NAME]
      schema: dbt_[YOUR_NAME]
      threads: 4
    prod:
      type: snowflake
      account: [enter account]
      user: [enter username]
      password: [enter password]
      role: 
      database: TRAINING_DB_[YOUR_NAME]
      warehouse: TRAINING_WH_[YOUR_NAME]
      schema: dbt
      threads: 4
```
