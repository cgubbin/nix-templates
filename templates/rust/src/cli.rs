use clap::Parser;

#[derive(Debug, Parser)]
#[command(version, about = "Example Rust CLI application", long_about = None)]
pub struct Cli {
    /// Name to greet
    #[arg(short, long, default_value = "world")]
    pub name: String,

    /// Emit JSON instead of plain text
    #[arg(long)]
    pub json: bool,
}
