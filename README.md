# Purpose

To document performance of ViewComponent, Rails Partials,
Dry-View, Trailblazer Cells, Papercraft and Phlex Components.

## Benchmarks

Benchmarks arent representative of real life and just
render nested components / partials. Take all numbers with
a grain of salt.

## Contributing

Feel free to submit a PR for optimization of views and
other use-cases / view layers.

## Setup

```bash
git clone https://github.com/paramagicdev/view-layer-benchmarks.git
cd view-layer-benchmarks
bundle install
```

The original benchmark used a minimalistic component with a little to none logic.
To have a sense of a real-world components/templates usage, a new setup has been added that tests a data table-like component (only ERB, View Component and Phlex are supported for now).

The original (Phlex) code was extracted from AnyCable+ project—that's why we call this benchmark "cables".

Run it as follows:

```sh
$ TYPE=cables bundle exec rake benchmark

Warming up --------------------------------------
      view_component   682.000 i/100ms
            partials   168.000 i/100ms
               phlex     1.240k i/100ms
Calculating -------------------------------------
      view_component      6.699k (± 4.0%) i/s -     67.518k in  10.096344s
            partials      1.567k (±12.8%) i/s -     15.288k in  10.081615s
               phlex     12.063k (± 2.8%) i/s -    121.520k in  10.081488s

Comparison:
               phlex:    12063.3 i/s
      view_component:     6699.0 i/s - 1.80x  slower
            partials:     1567.4 i/s - 7.70x  slower
```

