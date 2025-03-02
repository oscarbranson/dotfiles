# LaTeX Cambridge Letter Class

Created by Oscar Branson (ob266@cam.ac.uk) on 28/02/2020. No warranty supplied.

This extends the `article` class to produce an approximation of the Cambridge Letterhead produced by the Communications Resources office. It looks about right, but might not be exact.

## Installation
First, you'll want to place 2 files within the 'media' folder named:
- CamLogo - the logo of your particular department - by default a University one.
- signature - a file containing your signature. A png with a transparrent background or a pdf would be best.

Now you're ready to install. These instructions work on Linux - you're on your own on other operating systems.

1. Identify your TEXMFHOME directory (location where LaTeX looks for local files) with `kpsewhich -var-value=TEXMFHOME`. This will probably be something like `~/texmf`.
2. `cd` into the TEXMFHOME directory, and create `TEXMFHOME/tex/latex/` sub folders.
3. Place the cam_letter.cls and the 'media' folder inside this the `latex` directory you've just created.
4. Run `texhash TEXMFHOME` (replacing TEXMFHOME with the value returned in step 1.)
5. Confirm it worked by running `kpsewhich cam_letter.cls`. If it has worked, it will return the path of cam_letter.cls.

## Use
See `letter_example.tex`.

Create your document as normal, specifying `cam_letter` as the `\documentclass`.
The template accepts a number of variables to fill out the various fields associated with the letter.

### Variables
These should be specified in the preamble using standard `\variable{value}` LaTeX notation. In addresses use `\\` to denote a line break. Acceptated variables:
- fromname
- fromtitle
- fromposition
- fromaddress
- fromtel
- fromemail
- fromweb
- toname
- toaddress
- opening
- subject (optional)

By default, all are blank.