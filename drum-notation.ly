\version "2.18.2"

% ===========================================================================%
%                       Customized Drum Notations                            %
%                                                                            %
%  Taken from The Lilypond Cookbook blog:                                    %
%  http://lilypond-cookbook.tumblr.com/post/75485862838/drum-music-template  %
% ===========================================================================%
#(define mydrums '(
                    ( ridecymbal    cross    #f         6)
                    ( ridecymbala   xcircle  #f         6)
                    ( crashcymbal   cross    #f         7)
                    ( splashcymbal  harmonic #f         7)
                    ( chinesecymbal diamond  #f         7)
                    ( hihat         cross    #f         5)
                    ( closedhihat   cross    "stopped"  5)
                    ( openhihat     cross    "open"     5)
                    ( halfopenhihat cross    "halfopen" 5)
                    ( pedalhihat    cross    #f        -5)
                    ( snare         default  #f         1)
                    ( sidestick     cross    #f         1)
                    ( lowmidtom     default  #f         0)
                    ( lowtom        default  #f        -1)
                    ( hightom       default  #f         3)
                    ( bassdrum      default  #f        -3)))

%=============================================%
%   Custom open and half-open ornamentation   %
%   - This looks nice, but adds complexity.   %
%   - Test this to determine whether I want   %
%     to use it when notating drums.          %
%=============================================%
pth = #'((moveto 1 0.4) (lineto 0 -0.4))
hop = \markup{\hspace #0.5 \draw-circle #.4 #0.1 ##f}
hhop = \markup{ \combine \hop \path #0.1 #pth }

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
note-layout = \drummode {
  \stemUp

  {
    sn4^"snare" ss s2
    bd4^"bass" s s2
    hh4^"hihat" hhc hho hhho
    hhp4^"hihat — foot" hhp_\open s2
    cymr4^"ride" cymra s2
    tomh4^"4 pc" toml s2
    tommh4^"5 pc" tomml tomfh s
    cymc4^"cymbals" cyms chinesecymbal s
  }
}

%===============================%
%   Default Hihat Note Layout   %
%===============================%
default-hihat-note-layout = \drummode {
  \stemUp

  {
    hh4^\stopped hh^\open hh^\halfopen s
    hhp4 hhp_\open s2
  }
}

%==================================%
%   Customized Hihat Note Layout   %
%==================================%
customized-hihat-note-layout = \drummode {
  \stemUp

  {
    hh4^\stopped hh^\hop hh^\hhop s
    hhp4 hhp_\hop s2
  }
}


\score {
  \header { piece = "Common Note Head Styles" }

  \new DrumStaff \common-note-heads
}

\score {
  \header { piece = "Default Note Layout" }

  \new DrumStaff \note-layout
}

\score {
  \header { piece = "Customized Note Layout" }

  \new DrumStaff {
    \set DrumStaff.drumStyleTable = #(alist->hash-table mydrums)
    \note-layout
  }
}

\score {
  \header { piece = "Default Hihat Note Layout" }

  \new DrumStaff {
    \default-hihat-note-layout
  }
}

\score {
  \header { piece = "Customized Hihat Note Layout" }

  \new DrumStaff {
    \set DrumStaff.drumStyleTable = #(alist->hash-table mydrums)
    \customized-hihat-note-layout
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
