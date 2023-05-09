use cairo_template::math;

#[test]
fn test_math() {
    assert(math::add(2, 3) == 5, 'invalid');
    // assert(math::fib(0, 1, 10) == 55, 'invalid');
}
