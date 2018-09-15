// Inso Script Grammar
// ==========================
// default syntax -  name:(emotion or action) lines
// 

Script = sentence:Sentence+

Sentence = name:Name _ emotion:Parenthese? _ lines:Char+ {return {"name":name, "emotion":emotion?emotion:"", "lines":lines.join('').replace(/\s*$/,'')}}

Name = NL?  _ name:Char+ _ ":" {return name.join('')}
Parenthese = "(" _ emotion:Char+ _ ")"{return emotion.join('')}

Char = 
!( Escapes/"\\"/NL) char:. { return char; }
  / "\\" sequence:EscapeSequence { return sequence; }
  /NL (!(Name)/&(NL)){return "\n";}
  
   Escapes = ":"/"("/")"
  
 EscapeSequence
  = "'"
  / '"'
  /":"
  /"("
  /")"
  / "\\"
  / "b"  { return "\b";   }
  / "f"  { return "\f";   }
  / "n"  { return "\n";   }
  / "r"  { return "\r";   }
  / "t"  { return "\t";   }
  / "v"  { return "\x0B"; }

 _ "Unnecessary Space" 
 = [ \t]*
 
 
 NL "new line" 
 = [\n\r]