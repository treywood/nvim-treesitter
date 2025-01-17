; From MDeiml/tree-sitter-markdown
(code_span) @markup.raw @nospell

(emphasis) @markup.italic

(strong_emphasis) @markup.strong

(strikethrough) @markup.strikethrough

[
  (link_destination)
  (uri_autolink)
] @markup.link.url @nospell

(shortcut_link
  (link_text) @nospell)

[
  (link_label)
  (link_text)
  (link_title)
  (image_description)
] @markup.link.label

[
  (backslash_escape)
  (hard_line_break)
] @string.escape

; Conceal codeblock and text style markers
((code_span_delimiter) @markup.raw
  (#set! conceal ""))

((emphasis_delimiter) @markup.strong
  (#set! conceal ""))

; Conceal inline links
(inline_link
  [
    "["
    "]"
    "("
    (link_destination)
    ")"
  ] @markup.link
  (#set! conceal ""))

; Conceal image links
(image
  [
    "!"
    "["
    "]"
    "("
    (link_destination)
    ")"
  ] @markup.link
  (#set! conceal ""))

; Conceal full reference links
(full_reference_link
  [
    "["
    "]"
    (link_label)
  ] @markup.link
  (#set! conceal ""))

; Conceal collapsed reference links
(collapsed_reference_link
  [
    "["
    "]"
  ] @markup.link
  (#set! conceal ""))

; Conceal shortcut links
(shortcut_link
  [
    "["
    "]"
  ] @markup.link
  (#set! conceal ""))

; Replace common HTML entities.
((entity_reference) @character.special
  (#eq? @character.special "&nbsp;")
  (#set! conceal ""))

((entity_reference) @character.special
  (#eq? @character.special "&lt;")
  (#set! conceal "<"))

((entity_reference) @character.special
  (#eq? @character.special "&gt;")
  (#set! conceal ">"))

((entity_reference) @character.special
  (#eq? @character.special "&amp;")
  (#set! conceal "&"))

((entity_reference) @character.special
  (#eq? @character.special "&quot;")
  (#set! conceal "\""))

((entity_reference) @character.special
  (#any-of? @character.special "&ensp;" "&emsp;")
  (#set! conceal " "))
