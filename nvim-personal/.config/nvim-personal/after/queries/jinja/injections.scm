((inline) @injection.content
  (#set! injection.language "jinja_inline"))

((comment) @injection.content
  (#set! injection.language "comment"))

((content) @injection.content
  (#set! injection.language "sql")
  (#set! injection.combined))
