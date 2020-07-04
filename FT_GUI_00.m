function varargout = FT_GUI_00(varargin)
% FT_GUI_00 MATLAB code for FT_GUI_00.fig
%      FT_GUI_00, by itself, creates a new FT_GUI_00 or raises the existing
%      singleton*.
%
%      H = FT_GUI_00 returns the handle to a new FT_GUI_00 or the handle to
%      the existing singleton*.
%
%      FT_GUI_00('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FT_GUI_00.M with the given input arguments.
%
%      FT_GUI_00('Property','Value',...) creates a new FT_GUI_00 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FT_GUI_00_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FT_GUI_00_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FT_GUI_00

% Last Modified by GUIDE v2.5 05-Jul-2020 00:11:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FT_GUI_00_OpeningFcn, ...
                   'gui_OutputFcn',  @FT_GUI_00_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before FT_GUI_00 is made visible.
function FT_GUI_00_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FT_GUI_00 (see VARARGIN)

global gstop
global gpause
gstop = 0;
gpause = 0;

% Choose default command line output for FT_GUI_00
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FT_GUI_00 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FT_GUI_00_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function edit_funk_Callback(hObject, eventdata, handles)
% hObject    handle to edit_funk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_funk as text
%        str2double(get(hObject,'String')) returns contents of edit_funk as a double


% --- Executes during object creation, after setting all properties.
function edit_funk_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_funk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_ab_Callback(hObject, eventdata, handles)
% hObject    handle to slider_ab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_ab_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_ab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in popup_nft.
function popup_nft_Callback(hObject, eventdata, handles)
% hObject    handle to popup_nft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_nft contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_nft


% --- Executes during object creation, after setting all properties.
function popup_nft_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_nft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
    


% --- Executes on button press in pb_draw.
function pb_draw_Callback(hObject, eventdata, handles)
% hObject    handle to pb_draw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gstop
global gpause
gstop = 0;
gpause = 0;

xa = 0;
xe = 2*pi;
nft = get(handles.popup_nft,'Value');

T = xe-xa;
dt = T/100;
x = xa:dt:xe;

% Eingabe/Check
try
    funk = str2func(['@(x) (x-x)+',get(handles.edit_funk,'String')]);
    funk(x);
catch
    answer = questdlg({'Incorrect Function!','','What would you do?',''}, ...
        'Warning', ...
        'Try again','Example','Help','Try again');
    switch answer
        case 'Try again'
            pb_stop_Callback();
            return
        case 'Example'
            funk0 = 'x.^(1/2)';
            set(handles.edit_funk,'String',funk0)
            funk = str2func(['@(x)',funk0]);
        case 'Help'
            msgbox('"Help" is not finished yet','Help','warn');
            pb_stop_Callback();
            return
    end
end
if exist('answer') == 1 && isempty(answer)
    pb_stop_Callback();
    return
end
if ~isreal(funk(x))
    msgbox('Complex function is not allowed!','Warning','warn');
    pb_stop_Callback();
    return
end

% Fourier-Trafo
[a,b,~,~,~,F] = FT_GUI_Fourier_Trafo(funk,nft,x);
[ab] = FT_GUI_AB_Text(a,b);
disp(ab')

% Hilfswerte fuer Plot
ymax = max(max(F(1,:,end)),max(funk(x)));
if ymax < 0 
    yMax = 0;
else
    yMax = ymax+abs(fix(ymax*5)/10);
end
ymin = min(min(F(1,:,end)),min(funk(x)));
if ymin > 0 
    yMin = 0;
else
    yMin = ymin-abs(fix(ymin*5)/10);
end
xmax = max(F(2,:,end));
xmin = min(F(2,:,end));
xMax = max(xmax,abs(xmin));
O = -fix(xMax*15)/10;
if O > -1
    O =-1;
end
ax1 = handles.axes1;
tmp = 0;    % Wiederholung nach 1. Periodenzeit

% Plot
while gstop == 0 && isempty(findobj(handles.figure1)) == 0
    for n = 1:1:length(x)
        if tmp == 0
            N = n;
        else
            N = length(x);        
        end
        p_funk = plot(ax1,x(1,1:N),funk(x(1,1:N)),'Color','#77AC30');
        hold(ax1,'on')
        p_ft = plot(ax1,x(1,1:N),F(1,1:N,end),'k');
        plot(ax1,O+F(2,:,end),F(1,:,end),'k')
        for m = 1:1:nft
            plot(ax1,[O+F(2,n,m) O+F(2,n,m+1)],[F(1,n,m) F(1,n,m+1)],'Marker','.','MarkerSize',10,'Color','k')
        end
        if funk(x(1,n)) < F(1,n,end)
            col = '#D95319';
        else
            col = '#0072BD';
        end
        plot(ax1,[x(n) x(n)],[funk(x(1,n)) F(1,n,end)],'Color',col)
        plot(ax1,x(1,n),funk(x(1,n)),'Marker','.','MarkerSize',10,'Color','#77AC30');       
        plot(ax1,[O+F(2,n,end) x(1,n)],[F(1,n,end) F(1,n,end)],'Marker','.','MarkerSize',10,'Color','k')
        
        ax1.XLim = ([2*O+xa xe]);
        ax1.YLim = ([yMin yMax]);
        legend([p_funk p_ft],{'f(x)','Fourier-Trafo'},'location','NorthEast')
        ax1.XTick = (xa:xe);
        ax1.XAxisLocation = 'origin';
        ax1.YAxisLocation = 'origin';
        grid(ax1,'on')
        grid(ax1,'minor')
        ax1.DataAspectRatio = ([1 1 1]);
        drawnow
        while gpause ~= 0
            uiwait
        end
        if gstop ~= 0
            break
        end
        hold(ax1,'off')
    end
    tmp = 1;
end


% --- Executes on button press in pb_pause.
function pb_pause_Callback(hObject, eventdata, handles)
% hObject    handle to pb_pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gpause
if gpause ~= 0
    gpause = 0;
else
    gpause = 1;
end
uiresume


% --- Executes on button press in pb_stop.
function pb_stop_Callback(hObject, eventdata, handles)
% hObject    handle to pb_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gpause
if gpause == 1
    uiresume
    gpause = 0;
end
global gstop
gstop = 1;


% --- Executes on button press in pb_clear.
function pb_clear_Callback(hObject, eventdata, handles)
% hObject    handle to pb_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pb_stop_Callback();
cla(handles.axes1)


% --- Executes on button press in pb_info.
function pb_info_Callback(hObject, eventdata, handles)
% hObject    handle to pb_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://en.wikipedia.org/wiki/Fourier_series')

% --- Executes on button press in pb_close.
function pb_close_Callback(hObject, eventdata, handles)
% hObject    handle to pb_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pb_stop_Callback();
close


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
pb_stop_Callback();
delete(hObject);