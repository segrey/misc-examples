test('a', () => {
  expect(1).toBe(2);
});
test('b', () => {
  throw Error('aaa');
});
