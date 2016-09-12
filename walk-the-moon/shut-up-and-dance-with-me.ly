\version "2.18.2"

\header {
  title = "Walk The Moon — Shut Up And Dance With Me"
}

%%%%%%%%%%%%
%   TODO   %
%%%%%%%%%%%%
% - Add indicators for when other instruments come in (e.g. "+lyrics 'blah blah blah...'").

up = \drummode {
  \stemUp
  \override Beam #'positions = #'(5 . 5)
  \numericTimeSignature
  \set countPercentRepeats = ##t

  %%%%%%%%%%%%%
  %   INTRO   %
  %%%%%%%%%%%%%
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

  %%%%%%%%%%%%%
  %   VERSE   %
  %%%%%%%%%%%%%
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

  %%%%%%%%%%%%%%%%%%
  %   PRE-CHORUS   %
  %%%%%%%%%%%%%%%%%%
  {
    r8 \mark "Pre-chorus" bd <sn hhho>[ bd] <bd hhho>4 <sn hhho> |
    hhho8[ bd] <sn hhho>[ bd] <bd hhho>[ bd] <sn hhho>[ bd] |
    hhho8[ bd] <sn hhho>[ bd] <bd hhho>4 <sn cymc> |
    r8 sn sn[ sn] sn[ sn16 sn] sn[ sn sn sn] |
  }
  \break

  %%%%%%%%%%%%%%
  %   CHORUS   %
  %%%%%%%%%%%%%%
  \set countPercentRepeats = ##t
  \set repeatCountVisibility = #(every-nth-repeat-count-visible 4)
  \repeat percent 8 {
    <bd cymc>8[ hho16 hh] \mark "Chorus" <bd sn hh>8[ hho16 hh] <bd hh>8[ hho16 hh] <bd sn hh>8[ hho16 hh] |
  }
}

\score {
  \new DrumStaff \up

  \layout {}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   PAGE CUSTOMIZATIONS   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\paper{
  #(set-paper-size "letter")
  indent=#0
  line-width=#200
  oddFooterMarkup=##f
}
