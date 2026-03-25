use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq)]
pub struct Greeting {
    pub message: String,
}

impl Greeting {
    pub fn new(name: &str) -> Self {
        Self {
            message: format!("Hello, {name}!"),
        }
    }
}

pub fn hello(name: &str) -> String {
    Greeting::new(name).message
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn hello_formats_name() {
        assert_eq!(hello("world"), "Hello, world!");
    }

    #[test]
    fn greeting_serializes() {
        let greeting = Greeting::new("Rust");
        let json = serde_json::to_string(&greeting).expect("serialize greeting");
        assert!(json.contains("Hello, Rust!"));
    }
}
