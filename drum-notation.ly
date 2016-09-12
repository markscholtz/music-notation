\version "2.18.2"

% ===========================================================================%
%                       Customized Drum Notations                            %
%                                                                            %
%  Taken from The Lilypond Cookbook blog:                                    %
%  http://lilypond-cookbook.tumblr.com/post/75485862838/drum-music-template  %
% ===========================================================================%
#(define mydrums '(
                    ( ridecymbal    cross    #f   5)
                    ( ridecymbala   xcircle  #f   5)
                    ( crashcymbal   cross    #f   6)
                    ( splashcymbal  harmonic #f   6)
                    ( pedalhihat    cross    #f  -5)
                    ( hihat         cross    #f   5)
                    ( snare         default  #f   1)
                    ( sidestick     cross    #f   1)
                    ( lowmidtom     default  #f   0)
                    ( lowtom        default  #f  -1)
                    ( hightom       default  #f   3)
                    ( bassdrum      default  #f  -3)))

%=============================%
%   Common Note Head Styles   %
%=============================%
common-note-heads = \drummode {
  \stemUp

  {
    sn4
    \override NoteHead #'style = #'cross sn4
    \override NoteHead #'style = #'xcircle sn4
    \override NoteHead #'style = #'diamond sn4
    \override NoteHead #'style = #'slash sn4
    \override NoteHead #'style = #'harmonic sn4
    \override NoteHead #'style = #'triangle sn4
    s
  }
}

%=========================%
%   Default Note Layout   %
%=========================%
default-note-layout = \drummode {
  \stemUp

  {
    sn4^"snare" ss s2
    bd4^"bass" s hh^"hat" hhp
    cymr4^"ride" cymra s2
    tomh4^"4 pc" toml s2
    tommh4^"5 pc" tomml tomfh s
    cymc4^"cymbals" cyms chinesecymbal s
  }
}

%============================%
%   Customized Note Layout   %
%============================%
customized-note-layout = \drummode {
  \stemUp

  {
    sn4^"snare" ss s2
    bd4^"bass" s hh^"hat" hhp
    cymr4^"ride" cymra s2
    tomh4^"4 pc" toml s2
    tommh4^"5 pc" tomml tomfh s
    cymc4^"cymbals" cyms chinesecymbal s
  }
}

\score {
  \header { piece = "Common Note Head Styles" }

  \new DrumStaff \common-note-heads
}

\score {
  \header { piece = "Default Note Layout" }

  \new DrumStaff \default-note-layout
}

\score {
  \header { piece = "Customized Note Layout" }

  \new DrumStaff {
    \set DrumStaff.drumStyleTable = #(alist->hash-table mydrums)
    \customized-note-layout
  }
}


%=========================%
%   Page Customizations   %
%=========================%
\paper{
  #(set-paper-size "letter")
  indent=#0
  line-width=#200
  oddFooterMarkup=##f
}
