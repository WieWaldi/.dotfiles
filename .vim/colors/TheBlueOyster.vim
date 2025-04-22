" +---------------------------------------------------------------------------+
" | ~/.vim/colors/TheBlueOyster.vim                                           |
" +---------------------------------------------------------------------------+
" | Copyright © 2024 Waldemar Schroeer                                        |
" |                  waldemar.schroeer(at)rz-amper.de                         |
" +---------------------------------------------------------------------------+
" |                                                                           |
" | 'TheBlueOyster' -- Vim color sheme.                                       |
" |                                                                           |
" | Maintainer:   Waldemar Schroeer                                           |
" |               waldemar.schroeer(at)rz-amper.de                            |
" | Description:  A Simple solarized color scheme with violet                 |
" |               and pink highlights. Based on the 'flattened_light.vim'     |
" |               color scheme by Romain Lafourcade.                          |
" |               https://github.com/romainl/flattened                        |
" +---------------------------------------------------------------------------+

highlight clear
let colors_name = 'TheBlueOyster'
highlight Normal                                  cterm=NONE               ctermfg=NONE    ctermbg=NONE    guifg=NONE      guibg=NONE      gui=NONE
highlight ColorColumn                             cterm=NONE               ctermbg=230                                     guibg=#eee8d5   gui=NONE
highlight Comment                                 cterm=NONE               ctermfg=14                      guifg=#93a1a1                   gui=italic
highlight ConId                                   cterm=NONE               ctermfg=3                       guifg=#b58900                   gui=NONE
highlight Conceal                                 cterm=NONE               ctermfg=4       ctermbg=NONE    guifg=#268bd2   guibg=NONE      gui=NONE
highlight Constant                                cterm=NONE               ctermfg=6                       guifg=#2aa198                   gui=NONE
highlight Cursor                                  cterm=NONE               ctermfg=15      ctermbg=11      guifg=#000000   guibg=#00ff00   gui=NONE
highlight CursorColumn                            cterm=NONE               ctermbg=7                                       guibg=#ded8c5   gui=NONE
highlight CursorLine                              cterm=bold,underline     ctermbg=7                                       guibg=#eee8d5   gui=bold,underline
highlight CursorLineNr                            cterm=bold,italic        ctermfg=255     ctermbg=53      guifg=#5f005f   guibg=#eee8d5   gui=bold,italic
highlight DiffAdd                                 cterm=NONE               ctermfg=2       ctermbg=7       guifg=#719e07   guibg=#eee8d5   gui=NONE        guisp=#719e07
highlight DiffChange                              cterm=NONE               ctermfg=3       ctermbg=7       guifg=#b58900   guibg=#eee8d5   gui=NONE        guisp=#b58900
highlight DiffDelete                              cterm=NONE               ctermfg=1       ctermbg=7       guifg=#dc322f   guibg=#eee8d5   gui=NONE
highlight DiffText                                cterm=NONE               ctermfg=4       ctermbg=7       guifg=#268bd2   guibg=#eee8d5   gui=NONE        guisp=#268bd2
highlight Directory                               cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight Error                                   cterm=NONE               ctermfg=1       ctermbg=NONE    guifg=#dc322f   guibg=#fdf6e3   gui=NONE
highlight ErrorMsg                                cterm=reverse            ctermfg=1       ctermbg=NONE    guifg=#dc322f   guibg=NONE      gui=reverse
highlight FoldColumn                              cterm=NONE               ctermfg=11      ctermbg=7       guifg=#657b83   guibg=#eee8d5   gui=NONE
highlight Folded                                  cterm=NONE,underline     ctermfg=11      ctermbg=7       guifg=#657b83   guibg=#eee8d5   gui=NONE        guisp=#fdf6e3  
highlight HelpExample                             cterm=NONE               ctermfg=10                      guifg=#586e75                   gui=NONE
highlight Identifier                              cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight IncSearch                               cterm=standout           ctermfg=9                       guifg=#cb4b16                   gui=standout  
highlight LineNr                                  cterm=NONE               ctermfg=133     ctermbg=53      guifg=#af5faf   guibg=#5f005f   gui=NONE
highlight MatchParen                              cterm=NONE               ctermfg=1       ctermbg=14      guifg=#dc322f   guibg=#93a1a1   gui=NONE
highlight ModeMsg                                 cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight MoreMsg                                 cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight NonText                                 cterm=NONE               ctermfg=12                      guifg=#839496                   gui=NONE
highlight Pmenu                                   cterm=NONE               ctermfg=53      ctermbg=140     guifg=#5f005f   guibg=#af87d7   gui=NONE
highlight PmenuSbar                               cterm=NONE               ctermfg=140     ctermbg=53      guifg=#af87d7   guibg=#5f005f   gui=NONE
highlight PmenuSel                                cterm=NONE               ctermfg=230     ctermbg=53      guifg=#fdf6e3   guibg=#5f005f   gui=NONE
highlight PmenuThumb                              cterm=NONE               ctermfg=230     ctermbg=91      guifg=#fdf6e3   guibg=#8700af   gui=NONE
highlight PreProc                                 cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight Question                                cterm=NONE               ctermfg=6                       guifg=#2aa198                   gui=NONE
highlight Search                                  cterm=reverse            ctermfg=3       ctermbg=NONE    guifg=#b58900   guibg=NONE      gui=reverse
highlight SignColumn                              cterm=NONE               ctermfg=11      ctermbg=NONE    guifg=#657b83   guibg=#5f005f   gui=NONE
highlight Special                                 cterm=NONE               ctermfg=1                       guifg=#dc322f                   gui=NONE
highlight SpecialKey                              cterm=NONE               ctermfg=12      ctermbg=7       guifg=#839496   guibg=#eee8d5   gui=NONE
highlight SpellBad                                cterm=underline,italic   ctermfg=NONE    ctermbg=NONE                                    gui=underline,italic   guisp=#dc322f
highlight SpellCap                                cterm=underline,italic   ctermfg=NONE    ctermbg=NONE                                    gui=underline,italic   guisp=#6c71c4
highlight SpellLocal                              cterm=underline,italic   ctermfg=NONE    ctermbg=NONE                                    gui=underline,italic   guisp=#b58900
highlight SpellRare                               cterm=underline,italic   ctermfg=NONE    ctermbg=NONE                                    gui=underline,italic   guisp=#2aa198
highlight Statement                               cterm=NONE               ctermfg=2                       guifg=#719e07                   gui=NONE
highlight StatusLine                              cterm=NONE               ctermfg=133     ctermbg=53      guifg=#fdf6e3   guibg=#5f005f   gui=NONE        guisp=NONE   term=NONE
highlight StatusLineNC                            cterm=NONE               ctermfg=NONE    ctermbg=NONE    guifg=#fdf6e3   guibg=#5f005f   gui=NONE        guisp=NONE   term=NONE
highlight TabLine                                 cterm=NONE               ctermfg=133     ctermbg=53      guifg=#af5faf   guibg=#5f005f   gui=NONE         guisp=#657b83
highlight TabLineFill                             cterm=NONE               ctermfg=53      ctermbg=53      guifg=#5f005f   guibg=#5f005f   gui=NONE         guisp=#657b83
highlight TabLineSel                              cterm=NONE               ctermfg=230     ctermbg=53      guifg=#fdf6e3   guibg=#5f005f   gui=NONE         guisp=#657b83
highlight Title                                   cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight Todo                                    cterm=bold               ctermfg=5       ctermbg=15      guifg=#d33682   guibg=NONE      gui=bold
highlight Type                                    cterm=NONE               ctermfg=3                       guifg=#b58900                   gui=NONE
highlight Underlined                              cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight VarId                                   cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight VertSplit                               cterm=NONE               ctermfg=133     ctermbg=53      guifg=#af5faf   guibg=#5f005f   gui=NONE
highlight Visual                                  cterm=reverse            ctermfg=14      ctermbg=15      guifg=#93a1a1   guibg=#fdf6e3   gui=reverse
highlight VisualNOS                               cterm=reverse            ctermbg=7                                       guibg=#eee8d5   gui=reverse
highlight WarningMsg                              cterm=NONE               ctermfg=9                       guifg=#dc322f                   gui=NONE
highlight WildMenu                                cterm=NONE               ctermfg=535     ctermbg=140     guifg=#073642   guibg=#af87d7   gui=reverse
highlight cPreCondit                              cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight gitcommitBranch                         cterm=NONE               ctermfg=5                       guifg=#d33682                   gui=NONE
highlight gitcommitComment                        cterm=NONE               ctermfg=14                      guifg=#93a1a1                   gui=italic
highlight gitcommitDiscardedFile                  cterm=NONE               ctermfg=1                       guifg=#dc322f                   gui=NONE
highlight gitcommitDiscardedType                  cterm=NONE               ctermfg=1                       guifg=#dc322f                   gui=NONE
highlight gitcommitFile                           cterm=NONE               ctermfg=11                      guifg=#657b83                   gui=NONE
highlight gitcommitHeader                         cterm=NONE               ctermfg=14                      guifg=#93a1a1                   gui=NONE
highlight gitcommitOnBranch                       cterm=NONE               ctermfg=14                      guifg=#93a1a1                   gui=NONE
highlight gitcommitSelectedFile                   cterm=NONE               ctermfg=2                       guifg=#719e07                   gui=NONE
highlight gitcommitSelectedType                   cterm=NONE               ctermfg=2                       guifg=#719e07                   gui=NONE
highlight gitcommitUnmerged                       cterm=NONE               ctermfg=2                       guifg=#719e07                   gui=NONE
highlight gitcommitUnmergedFile                   cterm=NONE               ctermfg=3                       guifg=#b58900                   gui=NONE
highlight gitcommitUntrackedFile                  cterm=NONE               ctermfg=6                       guifg=#2aa198                   gui=NONE
highlight helpHyperTextEntry                      cterm=NONE               ctermfg=2                       guifg=#719e07                   gui=NONE
highlight helpHyperTextJump                       cterm=underline          ctermfg=4                       guifg=#268bd2                   gui=underline
highlight helpNote                                cterm=NONE               ctermfg=5                       guifg=#d33682                   gui=NONE
highlight helpOption                              cterm=NONE               ctermfg=6                       guifg=#2aa198                   gui=NONE
highlight helpVim                                 cterm=NONE               ctermfg=5                       guifg=#d33682                   gui=NONE
highlight hsImport                                cterm=NONE               ctermfg=5                       guifg=#d33682                   gui=NONE
highlight hsImportLabel                           cterm=NONE               ctermfg=6                       guifg=#2aa198                   gui=NONE
highlight hsModuleName                            cterm=underline          ctermfg=2                       guifg=#719e07                   gui=underline  
highlight hsNiceOperator                          cterm=NONE               ctermfg=6                       guifg=#2aa198                   gui=NONE
highlight hsStatement                             cterm=NONE               ctermfg=6                       guifg=#2aa198                   gui=NONE
highlight hsString                                cterm=NONE               ctermfg=12                      guifg=#839496                   gui=NONE
highlight hsStructure                             cterm=NONE               ctermfg=6                       guifg=#2aa198                   gui=NONE
highlight hsType                                  cterm=NONE               ctermfg=3                       guifg=#b58900                   gui=NONE
highlight hsTypedef                               cterm=NONE               ctermfg=6                       guifg=#2aa198                   gui=NONE
highlight hsVarSym                                cterm=NONE               ctermfg=6                       guifg=#2aa198                   gui=NONE
highlight hs_DeclareFunction                      cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight hs_OpFunctionName                       cterm=NONE               ctermfg=3                       guifg=#b58900                   gui=NONE
highlight hs_hlFunctionName                       cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight htmlArg                                 cterm=NONE               ctermfg=12                      guifg=#839496                   gui=NONE
highlight htmlEndTag                              cterm=NONE               ctermfg=14                      guifg=#93a1a1                   gui=NONE
highlight htmlSpecialTagName                      cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=italic
highlight htmlTag                                 cterm=NONE               ctermfg=14                      guifg=#93a1a1                   gui=NONE
highlight htmlTagN                                cterm=NONE               ctermfg=10                      guifg=#586e75                   gui=NONE
highlight htmlTagName                             cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight javaScript                              cterm=NONE               ctermfg=3                       guifg=#b58900                   gui=NONE
highlight pandocBlockQuote                        cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocBlockQuoteLeader1                 cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocBlockQuoteLeader2                 cterm=NONE               ctermfg=6                       guifg=#2aa198                   gui=NONE
highlight pandocBlockQuoteLeader3                 cterm=NONE               ctermfg=3                       guifg=#b58900                   gui=NONE
highlight pandocBlockQuoteLeader4                 cterm=NONE               ctermfg=1                       guifg=#dc322f                   gui=NONE
highlight pandocBlockQuoteLeader5                 cterm=NONE               ctermfg=11                      guifg=#657b83                   gui=NONE
highlight pandocBlockQuoteLeader6                 cterm=NONE               ctermfg=14                      guifg=#93a1a1                   gui=NONE
highlight pandocCitation                          cterm=NONE               ctermfg=5                       guifg=#d33682                   gui=NONE
highlight pandocCitationDelim                     cterm=NONE               ctermfg=5                       guifg=#d33682                   gui=NONE
highlight pandocCitationID                        cterm=underline          ctermfg=5                       guifg=#d33682                   gui=underline  
highlight pandocCitationRef                       cterm=NONE               ctermfg=5                       guifg=#d33682                   gui=NONE
highlight pandocComment                           cterm=NONE               ctermfg=14                      guifg=#93a1a1                   gui=italic
highlight pandocDefinitionBlock                   cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight pandocDefinitionIndctr                  cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight pandocDefinitionTerm                    cterm=standout           ctermfg=13                      guifg=#6c71c4                   gui=standout 
highlight pandocEmphasis                          cterm=NONE               ctermfg=11                      guifg=#657b83                   gui=italic
highlight pandocEmphasisDefinition                cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=italic
highlight pandocEmphasisHeading                   cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight pandocEmphasisNested                    cterm=NONE               ctermfg=11                      guifg=#657b83                   gui=NONE
highlight pandocEmphasisNestedDefinition          cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight pandocEmphasisNestedHeading             cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight pandocEmphasisNestedTable               cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocEmphasisTable                     cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=italic
highlight pandocEscapePair                        cterm=NONE               ctermfg=1                       guifg=#dc322f                   gui=NONE
highlight pandocFootnote                          cterm=NONE               ctermfg=2                       guifg=#719e07                   gui=NONE
highlight pandocFootnoteDefLink                   cterm=NONE               ctermfg=2                       guifg=#719e07                   gui=NONE
highlight pandocFootnoteInline                    cterm=NONE,underline     ctermfg=2                       guifg=#719e07                   gui=NONE,underline
highlight pandocFootnoteLink                      cterm=underline          ctermfg=2                       guifg=#719e07                   gui=underline  
highlight pandocHeading                           cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight pandocHeadingMarker                     cterm=NONE               ctermfg=3                       guifg=#b58900                   gui=NONE
highlight pandocImageCaption                      cterm=NONE,underline     ctermfg=13                      guifg=#6c71c4                   gui=NONE,underline
highlight pandocLinkDefinition                    cterm=underline          ctermfg=6                       guifg=#2aa198                   gui=underline  guisp=#839496
highlight pandocLinkDefinitionID                  cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocLinkDelim                         cterm=NONE               ctermfg=14                      guifg=#93a1a1                   gui=NONE
highlight pandocLinkLabel                         cterm=underline          ctermfg=4                       guifg=#268bd2                   gui=underline  
highlight pandocLinkText                          cterm=NONE,underline     ctermfg=4                       guifg=#268bd2                   gui=NONE,underline
highlight pandocLinkTitle                         cterm=underline          ctermfg=12                      guifg=#839496                   gui=underline  
highlight pandocLinkTitleDelim                    cterm=underline          ctermfg=14                      guifg=#93a1a1                   gui=underline   guisp=#839496
highlight pandocLinkURL                           cterm=underline          ctermfg=12                      guifg=#839496                   gui=underline  
highlight pandocListMarker                        cterm=NONE               ctermfg=5                       guifg=#d33682                   gui=NONE
highlight pandocListReference                     cterm=underline          ctermfg=5                       guifg=#d33682                   gui=underline  
highlight pandocMetadata                          cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocMetadataDelim                     cterm=NONE               ctermfg=14                      guifg=#93a1a1                   gui=NONE
highlight pandocMetadataKey                       cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocNonBreakingSpace                  cterm=reverse            ctermfg=1       ctermbg=NONE    guifg=#dc322f   guibg=NONE      gui=reverse  
highlight pandocRule                              cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocRuleLine                          cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocStrikeout                         cterm=reverse            ctermfg=14      ctermbg=NONE    guifg=#93a1a1   guibg=NONE      gui=reverse
highlight pandocStrikeoutDefinition               cterm=reverse            ctermfg=13      ctermbg=NONE    guifg=#6c71c4   guibg=NONE      gui=reverse
highlight pandocStrikeoutHeading                  cterm=reverse            ctermfg=9       ctermbg=NONE    guifg=#cb4b16   guibg=NONE      gui=reverse
highlight pandocStrikeoutTable                    cterm=reverse            ctermfg=4       ctermbg=NONE    guifg=#268bd2   guibg=NONE      gui=reverse
highlight pandocStrongEmphasis                    cterm=NONE               ctermfg=11                      guifg=#657b83                   gui=NONE
highlight pandocStrongEmphasisDefinition          cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight pandocStrongEmphasisEmphasis            cterm=NONE               ctermfg=11                      guifg=#657b83                   gui=NONE
highlight pandocStrongEmphasisEmphasisDefinition  cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight pandocStrongEmphasisEmphasisHeading     cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight pandocStrongEmphasisEmphasisTable       cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocStrongEmphasisHeading             cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight pandocStrongEmphasisNested              cterm=NONE               ctermfg=11                      guifg=#657b83                   gui=NONE
highlight pandocStrongEmphasisNestedDefinition    cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight pandocStrongEmphasisNestedHeading       cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight pandocStrongEmphasisNestedTable         cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocStrongEmphasisTable               cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocStyleDelim                        cterm=NONE               ctermfg=14                      guifg=#93a1a1                   gui=NONE
highlight pandocSubscript                         cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight pandocSubscriptDefinition               cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight pandocSubscriptHeading                  cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight pandocSubscriptTable                    cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocSuperscript                       cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight pandocSuperscriptDefinition             cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight pandocSuperscriptHeading                cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight pandocSuperscriptTable                  cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocTable                             cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocTableStructure                    cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocTableZebraDark                    cterm=NONE               ctermfg=4       ctermbg=7       guifg=#268bd2  guibg=#eee8d5    gui=NONE
highlight pandocTableZebraLight                   cterm=NONE               ctermfg=4       ctermbg=15      guifg=#268bd2  guibg=#fdf6e3    gui=NONE
highlight pandocTitleBlock                        cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocTitleBlockTitle                   cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocTitleComment                      cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight pandocVerbatimBlock                     cterm=NONE               ctermfg=3                       guifg=#b58900                   gui=NONE
highlight pandocVerbatimInline                    cterm=NONE               ctermfg=3                       guifg=#b58900                   gui=NONE
highlight pandocVerbatimInlineDefinition          cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight pandocVerbatimInlineHeading             cterm=NONE               ctermfg=9                       guifg=#cb4b16                   gui=NONE
highlight pandocVerbatimInlineTable               cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight perlHereDoc                             cterm=NONE               ctermfg=10      ctermbg=15      guifg=#586e75  guibg=#fdf6e3    gui=NONE
highlight perlStatementFileDesc                   cterm=NONE               ctermfg=6       ctermbg=15      guifg=#2aa198  guibg=#fdf6e3    gui=NONE
highlight perlVarPlain                            cterm=NONE               ctermfg=3       ctermbg=15      guifg=#b58900  guibg=#fdf6e3    gui=NONE
highlight rubyDefine                              cterm=NONE               ctermfg=10      ctermbg=15      guifg=#586e75  guibg=#fdf6e3    gui=NONE
highlight texMathMatcher                          cterm=NONE               ctermfg=3       ctermbg=15      guifg=#b58900  guibg=#fdf6e3    gui=NONE
highlight texMathZoneX                            cterm=NONE               ctermfg=3       ctermbg=15      guifg=#b58900  guibg=#fdf6e3    gui=NONE
highlight texRefLabel                             cterm=NONE               ctermfg=3       ctermbg=15      guifg=#b58900  guibg=#fdf6e3    gui=NONE
highlight texStatement                            cterm=NONE               ctermfg=6       ctermbg=15      guifg=#2aa198  guibg=#fdf6e3    gui=NONE
highlight vimCmdSep                               cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight vimCommand                              cterm=NONE               ctermfg=3                       guifg=#b58900                   gui=NONE
highlight vimCommentString                        cterm=NONE               ctermfg=13                      guifg=#6c71c4                   gui=NONE
highlight vimGroup                                cterm=NONE,underline     ctermfg=4                       guifg=#268bd2                   gui=NONE,underline
highlight vimHiGroup                              cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight vimHiLink                               cterm=NONE               ctermfg=4                       guifg=#268bd2                   gui=NONE
highlight vimIsCommand                            cterm=NONE               ctermfg=12                      guifg=#839496                   gui=NONE
highlight vimSynMtchOpt                           cterm=NONE               ctermfg=3                       guifg=#b58900                   gui=NONE
highlight vimSynType                              cterm=NONE               ctermfg=6                       guifg=#2aa198                   gui=NONE
highlight minimapCursor                           cterm=NONE               ctermfg=255     ctermbg=53      guibg=#5f005f   guifg=#FFFF87
highlight minimapRange                            cterm=NONE               ctermfg=255     ctermbg=91      guibg=#8700af   guifg=#FFFF87
highlight StatusSegCol0                           cterm=NONE               ctermfg=230     ctermbg=53      guifg=#fdf6e3   guibg=#5f005f   cterm=NONE gui=NONE
highlight StatusSepCol0                           cterm=NONE               ctermfg=53      ctermbg=91      guifg=#5f005f   guibg=#8700af   cterm=NONE gui=NONE
highlight StatusSegCol1                           cterm=NONE               ctermfg=230     ctermbg=91      guifg=#fdf6e3   guibg=#8700af   cterm=NONE gui=NONE
highlight StatusSepCol1                           cterm=NONE               ctermfg=91      ctermbg=140     guifg=#8700af   guibg=#af87d7   cterm=NONE gui=NONE
highlight StatusSegCol2                           cterm=NONE               ctermfg=235     ctermbg=140     guifg=#5f005f   guibg=#af87d7   cterm=NONE gui=NONE
highlight StatusSepCol2                           cterm=NONE               ctermfg=140     ctermbg=NONE    guifg=#af87d7   guibg=NONE      cterm=NONE gui=NONE
highlight StatusSegCol7                           cterm=NONE               ctermfg=235     ctermbg=140     guifg=#5f005f   guibg=#af87d7   cterm=NONE gui=NONE
highlight StatusSepCol7                           cterm=NONE               ctermfg=140     ctermbg=NONE    guifg=#af87d7   guibg=NONE      cterm=NONE gui=NONE
highlight StatusSegCol8                           cterm=NONE               ctermfg=230     ctermbg=91      guifg=#fdf6e3   guibg=#8700af   cterm=NONE gui=NONE
highlight StatusSepCol8                           cterm=NONE               ctermfg=91      ctermbg=140     guifg=#8700af   guibg=#af87d7   cterm=NONE gui=NONE
highlight StatusSegCol9                           cterm=NONE               ctermfg=230     ctermbg=53      guifg=#fdf6e3   guibg=#5f005f   cterm=NONE gui=NONE
highlight StatusSepCol9                           cterm=NONE               ctermfg=53      ctermbg=91      guifg=#5f005f   guibg=#8700af   cterm=NONE gui=NONE
highlight MyExtShowFile                           cterm=NONE               ctermfg=241     ctermbg=254     guifg=#839496   guibg=#eee8d5   cterm=NONE gui=NONE
highlight NERDTreeClosable                        cterm=NONE               ctermfg=53      ctermbg=NONE    guifg=#5f005f   guibg=NONE      cterm=NONE gui=NONE
highlight NERDTreeOpenable                        cterm=NONE               ctermfg=53      ctermbg=NONE    guifg=#5f005f   guibg=NONE      cterm=NONE gui=NONE
highlight NERDTreeFlags                           cterm=NONE               ctermfg=53      ctermbg=NONE    guifg=#8700af   guibg=NONE      cterm=NONE gui=NONE
highlight EndOfBuffer                             cterm=NONE               ctermfg=NONE    ctermbg=NONE    guifg=NONE      guibg=NONE      gui=NONE

hi link Boolean                    Constant
hi link Character                  Constant
hi link Conditional                Statement
hi link Debug                      Special
hi link Define                     PreProc
hi link Delimiter                  Special
hi link Exception                  Statement
hi link Float                      Number
hi link Function                   Identifier
hi link HelpCommand                Statement
hi link Include                    PreProc
hi link Keyword                    Statement
hi link Label                      Statement
hi link Macro                      PreProc
hi link Number                     Constant
hi link Operator                   Statement
hi link PreCondit                  PreProc
hi link Repeat                     Statement
hi link SpecialChar                Special
hi link SpecialComment             Special
hi link StorageClass               Type
hi link String                     Constant
hi link Structure                  Type
hi link SyntasticError             SpellBad
hi link SyntasticErrorSign         Error
hi link SyntasticStyleErrorLine    SyntasticErrorLine
hi link SyntasticStyleErrorSign    SyntasticErrorSign
hi link SyntasticStyleWarningLine  SyntasticWarningLine
hi link SyntasticStyleWarningSign  SyntasticWarningSign
hi link SyntasticWarning           SpellCap
hi link SyntasticWarningSign       Todo
hi link Tag                        Special
hi link Typedef                    Type

hi link diffAdded                  Statement
hi link diffBDiffer                WarningMsg
hi link diffCommon                 WarningMsg
hi link diffDiffer                 WarningMsg
hi link diffIdentical              WarningMsg
hi link diffIsA                    WarningMsg
hi link diffLine                   Identifier
hi link diffNoEOL                  WarningMsg
hi link diffOnly                   WarningMsg
hi link diffRemoved                WarningMsg

hi link gitcommitDiscarded         gitcommitComment
hi link gitcommitDiscardedArrow    gitcommitDiscardedFile
hi link gitcommitNoBranch          gitcommitBranch
hi link gitcommitSelected          gitcommitComment
hi link gitcommitSelectedArrow     gitcommitSelectedFile
hi link gitcommitUnmergedArrow     gitcommitUnmergedFile
hi link gitcommitUntracked         gitcommitComment

hi link helpSpecial                Special

hi link hsDelimTypeExport          Delimiter
hi link hsImportParams             Delimiter
hi link hsModuleStartLabel         hsStructure
hi link hsModuleWhereLabel         hsModuleStartLabel
hi link htmlLink                   Function

hi link lCursor                    Cursor

hi link pandocCodeBlock            pandocVerbatimBlock
hi link pandocCodeBlockDelim       pandocVerbatimBlock
hi link pandocEscapedCharacter     pandocEscapePair
hi link pandocLineBreak            pandocEscapePair
hi link pandocMetadataTitle        pandocMetadata
hi link pandocTableStructureEnd    pandocTableStructre
hi link pandocTableStructureTop    pandocTableStructre
hi link pandocVerbatimBlockDeep    pandocVerbatimBlock

hi link vimFunc                    Function
hi link vimSet                     Normal
hi link vimSetEqual                Normal
hi link vimUserFunc                Function
hi link vipmVar                    Identifier

hi clear SyntasticErrorLine
hi clear SyntasticWarningLine
hi clear helpLeadBlank
hi clear helpNormal
hi clear pandocTableStructre
