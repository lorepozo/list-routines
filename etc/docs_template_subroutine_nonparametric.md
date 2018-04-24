### @subroutine-name

`@subroutine-name` @description

Examples:
@in[e examples]{
- @(first e) => @(second e)

}

@conceptual-dependencies
@in[d deps]{
- [@d](#@if[(subroutine-is-parametric d)
            (string-append d "-parametric")
            d])

}
