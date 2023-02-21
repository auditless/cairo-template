use cairo_template::add;

#[test]
fn add_test() {
    assert(add::add(2, 3) == 5, 'invalid');
}
