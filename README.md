# chalk

Simple terminal string styling in Haskell, in the style of JavaScript's [sindresorhus/chalk](https://github.com/sindresorhus/chalk) and [sindresorhus/ansi-styles](https://github.com/sindresorhus/ansi-styles).

## Usage

![Styles](https://github.com/joom/chalk/blob/master/screenshot.png)

(Image borrowed from [sindresorhus/ansi-styles](https://github.com/sindresorhus/ansi-styles).) Use any of the styling functions above to get the effect you want.

Since these are functions, you can compose them as you like.

```haskell
import System.Console.Chalk

main = do
  putStrLn $ green "This is going to be green."
  putStrLn $ (underline . blue) "This is going to be blue and underlined."
```

The type of the styling functions is `(Monoid m, IsString m) => m -> m`, so you
can use any type that has an instance of Monoid and IsString, which probably covers
what you will use this for.

## License

MIT
