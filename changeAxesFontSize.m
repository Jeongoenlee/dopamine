
% 
% function changeAxesFontSize ( axes_handle, axes_fontsize, label_fontsize )
%
% changes the font size of axes and labels of a figure;
%

% 09/2006 RK

function changeAxesFontSize ( axes_handle, axes_fontsize, label_fontsize )

set(axes_handle, 'FontSize', axes_fontsize);
if nargin>=3 && length(label_fontsize)==1,
    set(get(axes_handle,'XLabel'), 'FontSize', label_fontsize);
    set(get(axes_handle,'YLabel'), 'FontSize', label_fontsize);
    set(get(axes_handle,'ZLabel'), 'FontSize', label_fontsize);
end;
