### @subroutine-name (parametric)

`@subroutine-name` @description

Examples:
@in[e examples]{
- @(first e)
  @in[ex (second e)]{
    - @(first ex) => @(second ex)

  }
}

@conceptual-dependencies
@in[d deps]{
- [@d](#@if[(subroutine-is-parametric d)
            (string-append d "-parametric")
            d])

}
