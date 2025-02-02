/**
 * @name Successfully extracted files
 * @description Lists all files in the source code directory that were extracted
 *   without encountering an error in the file.
 * @kind diagnostic
 * @id rb/diagnostics/successfully-extracted-files
 */

import codeql.ruby.AST
import codeql.ruby.Diagnostics

from File f
where
  not exists(ExtractionError e | e.getLocation().getFile() = f) and
  exists(f.getRelativePath())
select f, ""
