mod cli;

use anyhow::Result;
use clap::Parser;
use my_project::Greeting;

fn main() -> Result<()> {
    let args = cli::Cli::parse();
    let greeting = Greeting::new(&args.name);

    if args.json {
        println!("{}", serde_json::to_string(&greeting)?);
    } else {
        println!("{}", greeting.message);
    }

    Ok(())
}
