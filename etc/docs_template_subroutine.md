### @subroutine-name @if[is-parametric "(parametric)" ""]

`@subroutine-name` @(subroutine-description subroutine)

Types:
- Input: @(pretty-type (subroutine-input subroutine))
- Output: @(pretty-type (subroutine-output subroutine))
@if[(not is-parametric) ""]{
  @in[param (subroutine-params subroutine)]{
  - Param @(car param): @(pretty-type (cdr param))

  }
}

Examples:
@if[is-parametric]{
  @in[e examples]{
    - @(first e)
        @in[ex (second e)]{
        - @(first ex) => @(second ex)

        }
  }@in[e examples]{
    - @(first e) => @(second e)

  }
}

@if[(empty? (subroutine-deps subroutine)) "" "Conceptual dependencies:"]
@in[d (subroutine-deps subroutine)]{
- [@d](#@if[(subroutine-is-parametric d)
            (string-append d "-parametric")
            d])

}
