\version "2.18.2"

% ================================ %
%              Chorus              %
% ================================ %
chorus = \drummode {
  \mark "Chorus"
  \stemUp
    {
      <hh bd>8 hh <hh sn> hh <hh bd> <hh bd> <hh sn> <hh bd> |
      hh8 <hh bd> <hh sn> <hh bd> <hh bd> <hh bd> <hh sn> <hh tomh>16 <hh tomh> |
      bd4 <cymc sn> <hh bd>8 <hh bd> <hh sn> <hh bd> |
      hh8 <hh bd> <hh sn> <hh bd> <hh bd> <hh bd> <hh sn> <hh tomh>16 <hh tomh> |
    }
}

\score
{
  \new DrumStaff \chorus
}

chorus-no-hihats = \drummode {
  \mark "Chorus (no hihats)"
  \stemUp
    {
      bd4 sn bd8 bd sn bd |
      r8 bd sn bd bd bd sn tomh16 tomh |
    }
}

\score
{
  \new DrumStaff \chorus-no-hihats
}

mid-chorus-fill = \drummode {
  \mark "Mid chorus fill"
  \stemUp
    {
      bd4 sn bd sn |
      bd4 sn bd8 sn sn sn |
    }
}

\score
{
  \new DrumStaff \mid-chorus-fill
}

end-chorus-fill = \drummode {
  \mark "End chorus fill"
  \stemUp
    {
      bd4 sn bd sn |
      bd8 sn16 sn sn sn sn sn sn sn sn sn sn sn sn sn |
    }
}

\score
{
  \new DrumStaff \end-chorus-fill
}


% ================================ %
%              Verse               %
% ================================ %
verse = \drummode {
  \mark "Verse"
  \stemUp
    {
      <hh bd>8 hh <sn hh> hh <hh bd> hh <hh sn> hh |
      <hh bd>8 hh <sn hh> hh <hh bd> hh <hh sn> <hh bd> |
    }
}

\score
{
  \new DrumStaff \verse
}

mid-solo-fill = \drummode {
  \mark "Mid solo fill"
  \stemUp
    \set countPercentRepeats = ##t
    \set repeatCountVisibility = #(every-nth-repeat-count-visible 4)
    \repeat percent 6
    {
      <hh bd>8 hh <hh sn> hh <hh bd> <hh bd> <hh sn> hh |
    }
    {
      <hh bd>8 hh <hh sn> hh <hh bd> <hh bd> <hh sn> <hh bd> |
      <hh sn>8 <hh bd> <hh bd> <hh sn> <hh bd> <hh bd> <hh sn> <hh bd> |
    }
 }

% ================================ %
%               Solo               %
% ================================ %
\score
{
  \new DrumStaff \mid-solo-fill
}

end-solo-fill = \drummode {
  \mark "End solo fill"
  \stemUp
    \set countPercentRepeats = ##t
    \set repeatCountVisibility = #(every-nth-repeat-count-visible 4)
    \repeat percent 6
    {
      <hh bd>8 hh <hh sn> hh <hh bd> <hh bd> <hh sn> hh |
    }
    {
      <hh sn>8 <hh bd> <hh bd> <hh sn> <hh bd> <hh bd> <hh sn> <hho bd> |
      <hh bd>8 <hh sn> <hh bd> <hh bd> <hh sn> <hh bd> <hh sn> r |
    }
}

\score
{
  \new DrumStaff \end-solo-fill
}

outro = \drummode {
  \mark "Outro"
  \stemUp
    <hh bd>8 <hh bd> <hh sn> <hh bd> <hh sn> <hh bd> <hh bd> <hho sn> |
}

\score
{
  \new DrumStaff \outro
}
