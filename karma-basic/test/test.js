describe('spec', () => {
  it('that fails', () => {
    fail('This spec should not run!')
  })

  it('that succeeds', () => {
    expect(qqq(1, 1)).toBe(2)
  })
});

