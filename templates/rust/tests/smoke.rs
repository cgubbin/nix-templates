use my_project::{hello, Greeting};

#[test]
fn smoke_test_plain() {
    assert_eq!(hello("Rust"), "Hello, Rust!");
}

#[test]
fn smoke_test_struct() {
    let greeting = Greeting::new("Ferris");
    assert_eq!(greeting.message, "Hello, Ferris!");
}
