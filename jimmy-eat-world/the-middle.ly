\version "2.18.2"

\header {
  title = "Jimmy Eat World - The Middle"
}

\markup { Intro (8) }
\markup { Verse (16) }
\markup { Chorus (8) }
\markup { Verse (16) }
\markup { Chorus x 2 (16) }
\markup { Solo (16) }
\markup { Verse (16) }
\markup { Chorus (8) }
\markup { Chorus (6) }
\markup { Outro (1) }


% ================================ %
%              Verse               %
% ================================ %

verse = \drummode {
  \stemUp {
    <hh bd>8^"Verse" hh <sn hh> hh <hh bd> hh <hh sn> hh |
    <hh bd>8 hh <sn hh> hh <hh bd> hh <hh sn> <hh bd> |
  }
}


% ================================ %
%              Chorus              %
% ================================ %

chorus = \drummode {
  \stemUp {
    <hh bd>8^"Chorus" hh <hh sn> hh <hh bd> <hh bd> <hh sn> <hh bd> |
    hh8 <hh bd> <hh sn> <hh bd> <hh bd> <hh bd> <hh sn> <hh tomh>16 <hh tomh> |
    bd4 <cymc sn> <hh bd>8 <hh bd> <hh sn> <hh bd> |
    hh8 <hh bd> <hh sn> <hh bd> <hh bd> <hh bd> <hh sn> <hh tomh>16 <hh tomh> |
  }
}

chorus-no-hihats = \drummode {
  \stemUp {
    bd4^"Chorus (no hihats)" sn bd8 bd sn bd |
    r8 bd sn bd bd bd sn tomh16 tomh |
  }
}

mid-chorus-fill = \drummode {
  \stemUp {
    bd4^"Mid chorus fill" sn bd sn |
    bd4 sn bd8 sn sn sn |
  }
}

end-chorus-fill = \drummode {
  \stemUp {
    bd4^"End chorus fill" sn bd sn |
    bd8 sn16 sn sn sn sn sn sn sn sn sn sn sn sn sn |
  }
}


% ================================ %
%               Solo               %
% ================================ %

mid-solo-fill = \drummode {
  \stemUp
  \set countPercentRepeats = ##t
  \set repeatCountVisibility = #(every-nth-repeat-count-visible 4)
  \repeat percent 6 {
    <hh bd>8^"Mid solo fill" hh <hh sn> hh <hh bd> <hh bd> <hh sn> hh |
  }
  {
    <hh bd>8 hh <hh sn> hh <hh bd> <hh bd> <hh sn> <hh bd> |
    <hh sn>8 <hh bd> <hh bd> <hh sn> <hh bd> <hh bd> <hh sn> <hh bd> |
  }
 }

end-solo-fill = \drummode {
  \stemUp
  \set countPercentRepeats = ##t
  \set repeatCountVisibility = #(every-nth-repeat-count-visible 4)
  \repeat percent 6 {
    <hh bd>8^"End solo fill" hh <hh sn> hh <hh bd> <hh bd> <hh sn> hh |
  }
  {
    <hh sn>8 <hh bd> <hh bd> <hh sn> <hh bd> <hh bd> <hh sn> <hho bd> |
    <hh bd>8 <hh sn> <hh bd> <hh bd> <hh sn> <hh bd> <hh sn> r |
  }
}


% ================================ %
%              Outro               %
% ================================ %

outro = \drummode {
  \stemUp {
    <hh bd>8^"Outro" <hh bd> <hh sn> <hh bd> <hh sn> <hh bd> <hh bd> <hho sn> |
  }
}


% ================================ %
%               Song               %
% ================================ %

\new DrumStaff \verse
\new DrumStaff \chorus
\new DrumStaff \chorus-no-hihats
\new DrumStaff \mid-chorus-fill
\new DrumStaff \end-chorus-fill
\new DrumStaff \mid-solo-fill
\new DrumStaff \end-solo-fill
\new DrumStaff \outro
