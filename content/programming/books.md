---
title: the book printing episode
date: 2025-08-02
---

# the problem

over time i found quite a few programming books which i wanted to
read, books like [sicp]. but these books were quite expensive online,
sicp was listed on amazon around ₹4400/€44/$51. printing it myself
would cost me ₹800 which is a steal of a deal.

but there was one issue, the lisp code is synatx highlighted i.e. when
printed in grayscale, the readability is compromised. i searched on
the internet "how to convert a colored pdf to a black-and-white pdf"
and the results weren't that useful. it wasn't that simple, but since
i am not an average computer user, i saw an opportunity. 

[sicp]: https://web.mit.edu/6.001/6.037/sicp.pdf

# putting it together

i found `pdftoppm` which could convert the pages of the pdf file into
images and `imagemagick` which could transform the appearance of the
images and put them back into a pdf file. after reading imagemagick
[wiki] for quite some time, i found a few options which gave me
exactly what i wanted.

[wiki]: https://imagemagick.org/

```sh
magick $input_file \
    -colorspace Gray \
    -level 40%,100% \
    -gravity Center \
    -crop 90x90%+0+0 \
    +repage \
    $output_file
```
this converts the image to grayscale and increases the contrast
deepening the blacks, crops the extra margin space giving us a zoomed
in image.

# automating things with a makefile

a makefile is basically an evolved shell script, it can do everything
which a shell script can do, but in a makefile one can define the
relationships between sources and targets and this with the `-j` flag
exponentially speeds up things.

```make
SHELL       = bash
input_pdf   = sicp.pdf
output_pdf  = sicp_converted.pdf
page_count  = $(shell pdfinfo $(input_pdf) | awk '/^Pages:/ {print $2}' | sed 's/Pages://;s/ //g')

input_pdf_images_dir  		= $(input_pdf)_original
converted_pdf_images_dir 	= $(input_pdf)_converted

original_images 	= $(foreach page_number,$(shell seq -w 1 $(page_count)),$(shell echo $(input_pdf_images_dir)/$(input_pdf)-$(page_number).png))
converted_images 	= $(patsubst $(input_pdf_images_dir)/%.png,$(converted_pdf_images_dir)/%.png,$(original_images))
sorted_images_list 	= $(sort $(converted_images))

all: pdf_to_images create_converted_pdf

pdf_to_images:
	mkdir -p $(input_pdf_images_dir)
	pdftoppm $(input_pdf) $(input_pdf_images_dir)/$(input_pdf) -png

$(original_images) : pdf_to_images

create_converted_pdf : $(converted_images)
	magick $(sorted_images_list) $(output_pdf)

$(converted_pdf_images_dir)/%.png : $(input_pdf_images_dir)/%.png
	mkdir -p $(dir $@)
	magick $< \
		-colorspace Gray \
		-level 40%,100% \
		-gravity Center \
		-crop 90x90%+0+0 \
		+repage \
		$@

clean :
	rm -rf $(output_pdf) $(input_pdf_images_dir) $(converted_pdf_images_dir)
```

there's a lot of room for improvement, currently we convert the
whole pdf to images in `pdf_to_images:`, one could break that into
individual step where the original image is generated on the fly so
that we can run that on multiple threads and speed up things.

but this would take some time, some other day :).
