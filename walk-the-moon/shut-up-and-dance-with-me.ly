\version "2.18.2"

\header {
  title = "Walk The Moon — Shut Up And Dance With Me"
}

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

%==========%
%   TODO   %
%==========%
% - Add indicators for when other instruments come in (e.g. "+lyrics 'blah blah blah...'").

up = \drummode {
  \stemUp
  \override Beam #'positions = #'(5 . 5)
  \numericTimeSignature
  \set countPercentRepeats = ##t

  %===========%
  %   Intro   %
  %===========%
  { r1 \mark "Intro" | r1 | }
  \repeat percent 3 {
    bd4 bd bd bd |
    bd4 bd bd <bd sn> |
  }
  {
    <bd sn hh>8\<[ <sn hh>] <bd sn hh>[ <sn hh>] <bd sn hh>[ <sn hh>] <bd sn hh>[ <sn hh>] |
    <bd sn hh>8[ <sn hh>] <bd sn hh>[ <sn hh>] <bd sn hh>[ <sn hh>] <bd sn hh>[ <sn hh>\!] |
  }
  \break

  %===========%
  %   Verse   %
  %===========%
  \repeat percent 2 {
    bd4 \mark "Verse" bd bd bd |
    bd4 bd bd <bd sn> |
  }
  \repeat percent 3 {
    <bd hh>8[ hh] <bd hh>[ hh] <bd hh>[ hh] <bd hh>[ hh] |
    <bd hh>8[ hh] <bd hh>[ hh] <bd hh>[ hh] <bd hh>[ hho] |
  }
  {
    <bd hh>8[ hh] <bd hh>[ hh] <bd hh>[ hh] <bd hh>[ hh] |
    bd8[ <sn tomh>] <bd sn tomh>[ <sn tomh>] <bd sn tomh>[ <sn tomh>] <bd sn tomh>[ <sn tomh>]
  }
  \break

  %================%
  %   Pre-chorus   %
  %================%
  {
    r8 \mark "Pre-chorus" bd <sn hhho>[ bd] <bd hhho>4 <sn hhho> |
    hhho8[ bd] <sn hhho>[ bd] <bd hhho>[ bd] <sn hhho>[ bd] |
    hhho8[ bd] <sn hhho>[ bd] <bd hhho>4 <sn cymc> |
    r8 sn sn[ sn] sn[ sn16 sn] sn[ sn sn sn] |
  }
  \break

  %============%
  %   Chorus   %
  %============%
  \set countPercentRepeats = ##t
  \set repeatCountVisibility = #(every-nth-repeat-count-visible 4)
  \repeat percent 8 {
    <bd cymc>8[ hho16 hh] \mark "Chorus" <bd sn hh>8[ hho16 hh] <bd hh>8[ hho16 hh] <bd sn hh>8[ hho16 hh] |
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.drumStyleTable = #(alist->hash-table mydrums)
    \up
  }

  \layout {}
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
