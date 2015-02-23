{-# LANGUAGE OverloadedStrings #-}

module System.Console.Chalk (
  reset, bold, dim, italic, underline, inverse, hidden,
  strikethrough, black, red, green, yellow, blue,
  magenta, cyan, white, gray, bgBlack, bgRed, bgGreen,
  bgYellow, bgBlue, bgMagenta, bgCyan, bgWhite) where

import Control.Arrow ((***))
import Data.Monoid
import Data.String

-- | Single code number to ANSI code.
tag :: (Monoid m, IsString m) => m -> m
tag x = "\ESC[" <> x <> "m"

-- | Take a code number pair and convert it to a ANSI code pair.
tags
  :: (Monoid t1, Monoid t, IsString t1, IsString t) =>
     (t, t1) -> (t, t1)
tags = tag *** tag

-- | Take a code number pair and a type that fits IsString,
-- and wrap the latter with the ANSI codes.
wrap :: (Monoid m, IsString m) => (m, m) -> m -> m
wrap (l, r) s = cl <> s <> cr
  where (cl, cr) = tags (l, r)

reset, bold, dim, italic, underline, inverse, hidden,
  strikethrough, black, red, green, yellow, blue,
  magenta, cyan, white, gray, bgBlack, bgRed, bgGreen,
  bgYellow, bgBlue, bgMagenta, bgCyan, bgWhite ::
  (Monoid m, IsString m) => m -> m
reset         = wrap ("0", "0")
bold          = wrap ("1", "22")
dim           = wrap ("2", "22")
italic        = wrap ("3", "23")
underline     = wrap ("4", "24")
inverse       = wrap ("7", "27")
hidden        = wrap ("8", "28")
strikethrough = wrap ("9", "29")
black         = wrap ("30", "39")
red           = wrap ("31", "39")
green         = wrap ("32", "39")
yellow        = wrap ("33", "39")
blue          = wrap ("34", "39")
magenta       = wrap ("35", "39")
cyan          = wrap ("36", "39")
white         = wrap ("37", "39")
gray          = wrap ("90", "39")
bgBlack       = wrap ("40", "49")
bgRed         = wrap ("41", "49")
bgGreen       = wrap ("42", "49")
bgYellow      = wrap ("43", "49")
bgBlue        = wrap ("44", "49")
bgMagenta     = wrap ("45", "49")
bgCyan        = wrap ("46", "49")
bgWhite       = wrap ("47", "49")
