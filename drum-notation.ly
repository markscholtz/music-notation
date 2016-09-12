\version "2.18.2"

up = \drummode {
  \stemUp

  %%%%%%%%%%%%%%%%%%%%%%%%%%%
  %   DEFAULT NOTE LAYOUT   %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%
  sn4^"snare" ss s2 bd4^"bass" s hh^"hat" hhp
  cymr4^"ride" cymra s2
  tomh4^"4 pc" toml s2 tommh4^"5 pc" tomml tomfh s
  cymc4^"cymbals" cyms chinesecymbal s
  \break

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %   COMMON NOTE HEAD STYLES   %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  sn4
  \override NoteHead #'style = #'cross sn4
  \override NoteHead #'style = #'xcircle sn4
  \override NoteHead #'style = #'diamond sn4
  \override NoteHead #'style = #'slash sn4
  \override NoteHead #'style = #'harmonic sn4
  \override NoteHead #'style = #'triangle sn4
}

\score { << \new DrumStaff << \up >> >> }

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   PAGE CUSTOMIZATIONS   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\paper{
  #(set-paper-size "letter")
  indent=#0
  line-width=#200
  oddFooterMarkup=##f
}
