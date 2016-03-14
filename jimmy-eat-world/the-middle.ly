\version "2.18.2"

\header {
  title = "Jimmy Eat World - The Middle"
}


% ===========================================================================%
%                       Customized Drum Notations                            %
%                                                                            %
%  Taken from The Lilypond Cookbook blog:                                    %
%  http://lilypond-cookbook.tumblr.com/post/75485862838/drum-music-template  %
% ===========================================================================%
#(define md '(
  (ridecymbal   cross    #f  5)(ridebell     xcircle  #f  5)
  (crashcymbal  cross    #f  6)(splashcymbal harmonic #f  6)
  (pedalhihat   cross    #f -5)(hihat        cross    #f  5)
  (snare        default  #f  1)(sidestick    cross    #f  1)
  (lowmidtom    default  #f  0)(lowtom       default  #f -1)
  (hightom      default  #f  3)(bassdrum     default  #f -3)
))
setDrumstyle = \set DrumStaff.drumStyleTable=#(alist->hash-table md)


% ================================ %
%          Song Structure          %
% ================================ %
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
  \setDrumstyle
  \stemUp {
    <hh bd>8^"Verse" hh <sn hh> hh <hh bd> hh <hh sn> hh |
    <hh bd>8 hh <sn hh> hh <hh bd> hh <hh sn> <hh bd> |
  }
}


% ================================ %
%              Chorus              %
% ================================ %

chorus = \drummode {
  \setDrumstyle
  \stemUp {
    <hh bd>8^"Chorus" hh <hh sn> hh <hh bd> <hh bd> <hh sn> <hh bd> |
    hh8 <hh bd> <hh sn> <hh bd> <hh bd> <hh bd> <hh sn> <hh tomh>16 <hh tomh> |
    bd4 <cymc sn> <hh bd>8 <hh bd> <hh sn> <hh bd> |
    hh8 <hh bd> <hh sn> <hh bd> <hh bd> <hh bd> <hh sn> <hh tomh>16 <hh tomh> |
  }
}

chorus-no-hihats = \drummode {
  \setDrumstyle
  \stemUp {
    bd4^"Chorus (no hihats)" sn bd8 bd sn bd |
    r8 bd sn bd bd bd sn tomh16 tomh |
  }
}

mid-chorus-fill = \drummode {
  \setDrumstyle
  \stemUp {
    <hh bd>8^"Mid chorus fill" hh <hh sn> hh <hh bd> hh <hh sn> hh |
    <hh bd>8 hh <hh sn> hh <hh bd> <hh sn> <hh sn> <hh sn> |
  }
}

end-chorus-fill = \drummode {
  \setDrumstyle
  \stemUp {
    <hh bd>8^"End chorus fill" hh <hh sn> hh <hh bd> hh <hh sn> hh |
    <hh bd>8_"R" sn16_"R" sn sn sn sn sn sn sn sn sn sn sn sn sn |
  }
}


% ================================ %
%               Solo               %
% ================================ %

mid-solo-fill = \drummode {
  \setDrumstyle
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
  \setDrumstyle
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
  \setDrumstyle
  \stemUp {
    <hh bd>8^"Outro" <hh bd> <hh sn> <hh bd> <hh sn> <hh bd> <hh bd> <hho sn> |
  }
}


% ================================ %
%               Song               %
% ================================ %

\new DrumStaff \verse
\new DrumStaff \chorus
% \new DrumStaff \chorus-no-hihats
\new DrumStaff \mid-chorus-fill
\new DrumStaff \end-chorus-fill
\new DrumStaff \mid-solo-fill
\new DrumStaff \end-solo-fill
\new DrumStaff \outro

\layout {\context {\DrumStaff \numericTimeSignature}}


% ================================ %
%        Page Customizations       %
% ================================ %
\paper{
  #(set-paper-size "letter")
  indent=#0
  line-width=#200
  oddFooterMarkup=##f
  %oddHeaderMarkup=##f
  %bookTitleMarkup = ##f
  %scoreTitleMarkup = ##f
}
