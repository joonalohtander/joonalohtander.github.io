---
title: "Using Neovim for R and LaTeX"
author: "Joonalohtander"
date: "2026-02-26"
output: html_document
---

{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

## My Neovim Journey

I've been using Neovim for a while now, mainly for R and LaTeX work, and I’ve started to appreciate it for its simplicity and speed. It’s really just a keyboard-driven editor, which might seem a bit intimidating at first, but once you get used to it, it keeps you focused. You can navigate, edit, and run code almost entirely without leaving the keyboard, which I really like.

I often run Neovim on **Sway**, and it feels really smooth in that environment. No unnecessary distractions, just a clean, fast editor that lets me stay in flow.

## R Workflow

For R, I usually have a script open and send code directly to an R REPL. I rely on the R language server for basic autocomplete and diagnostics, which is enough for most tasks. Snippets help speed things up when writing common functions or loops. I also like using `telescope.nvim` for quickly jumping between scripts, datasets, or project files.

It’s surprisingly comfortable to work with plots and analyses entirely from Neovim. You just run the code, see the output in your REPL, and continue iterating. No mouse needed, which is nice for focus.

## LaTeX Workflow

I also use Neovim for writing LaTeX documents. With `vimtex` and `latexmk`, compilation feels almost invisible—you just save and things compile in the background. Forward and inverse search between the PDF output and source is handy for quick edits. 

When I include R code chunks via `knitr` in my LaTeX documents, it feels seamless. I can run the computations, embed results, and format everything without switching tools.

## Why I Like It

What really stands out for me is **speed and simplicity**. There’s no bloat, nothing slowing me down. Everything is just fast and keyboard-centric. I can focus entirely on what I’m doing, whether it’s coding, analyzing data, or writing a report. The Sway environment complements this setup perfectly, giving me a clean, tiling workspace where everything just fits together.

If you’re curious, you can check out my full Neovim configuration here: [https://github.com/joonalohtander/nvim](https://github.com/joonalohtander/nvim)
