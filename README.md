### 1. non-supervisor vs supervisor
```shell
$ git difftool non-supervisor supervisor
```

### 2. flat
* `calc` provides `Calc.sum(a, b)` 
* `echo` provides a process registered as `:echo`
* `my_app` uses `calc` and `echo` to provide `MyApp.echo_sum_of(a, b)`
```shell
$ git checkout flat && cd my_app
$ iex -S mix
iex> MyApp.echo_sum_of(10, 20)
:echo received 30
```

### 3. flat-conflict-deps
Pretty contrived, but `flat` branch with changes
* `calc` depends on `decimal 1.2.0`
* `echo` depends on `decimal 1.3.0`
```shell
calc $ mix deps.get # works
echo $ mix deps.get # works
my_app $ mix deps.get # error
```

### 4. umbrella
* `my_app` depends on `calc`, `echo`
* `my_another_app` depends on `my_app`
```shell
apps/my_another_app $ iex -S mix
iex> MyApp.echo_sum_of(10, 20)
:echo received 30
```

### 5. umbrella-dep-in-wrong-place
* `calc` uses `decimal`, but
* `decimal` is added in `echo` by mistake.

```shell
apps/calc $ iex -S mix
iex> Calc.sum(10, 20) # error
```
Not working on `apps/calc`.

``` shell
$ iex -S mix
iex> Calc.sum(10, 20) # works
```
Working on root. Broken dependencies are found when another app in umbrella depends on it.
