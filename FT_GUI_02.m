function varargout = FT_GUI_02(varargin)
% FT_GUI_02 MATLAB code for FT_GUI_02.fig
%      FT_GUI_02, by itself, creates a new FT_GUI_02 or raises the existing
%      singleton*.
%
%      H = FT_GUI_02 returns the handle to a new FT_GUI_02 or the handle to
%      the existing singleton*.
%
%      FT_GUI_02('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FT_GUI_02.M with the given input arguments.
%
%      FT_GUI_02('Property','Value',...) creates a new FT_GUI_02 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FT_GUI_02_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FT_GUI_02_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FT_GUI_02

% Last Modified by GUIDE v2.5 05-Jul-2020 22:21:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FT_GUI_02_OpeningFcn, ...
                   'gui_OutputFcn',  @FT_GUI_02_OutputFcn, ...
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


% --- Executes just before FT_GUI_02 is made visible.
function FT_GUI_02_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FT_GUI_02 (see VARARGIN)

global gstop
global gpause
gstop = 0;
gpause = 0;

% Choose default command line output for FT_GUI_02
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FT_GUI_02 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FT_GUI_02_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in checkbox_sw.
function checkbox_sw_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_sw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_sw


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
dt = T/500;
x = xa:dt:xe;

% Eingabe/Check
if get(handles.checkbox_sw,'Value')
    set(handles.edit_funk,'String','Square Wave')
    [Funk] = FT_GUI_Square_Wave(x,1,2,1);
else
    try
        funk = str2func(['@(x) (x-x)+',get(handles.edit_funk,'String')]);
        Funk = funk(x);
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
                Funk = funk(x);
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
    if ~isreal(Funk)
        msgbox('Complex function is not allowed!','Warning','warn');
        pb_stop_Callback();
        return
    end
end

% Fourier-Trafo
[a,b,S,C,CS,F] = FT_GUI_Fourier_Trafo_Value(Funk,nft,x);
[ab] = FT_GUI_AB_Text(a,b);
disp(ab')

% Hilfswerte fuer Plot
ymax = max(max(F(1,:,end)),max(Funk));
if ymax < 0 
    yMax = 0;
else
    yMax = ymax+abs(fix(ymax*5)/10);
end
ymin = min(min(F(1,:,end)),min(Funk));
if ymin > 0 
    yMin = 0;
else
    yMin = ymin-abs(fix(ymin*5)/10);
end

N = 10;
y = yMax/N;

ax1 = handles.axes1;

% Plot
while gstop == 0 && isempty(findobj(handles.figure1)) == 0
    for n = 1:1:2*nft+1
        for t = N:-1:0
            p_funk = plot(ax1,x,Funk,'Color','#77AC30');
            hold(ax1,'on')
            p_ft = plot(ax1,x,CS(n,:),'LineWidth',1.5,'Color','k');
            p_c = plot(ax1,0,0,'Color','#0072BD');
            p_s = plot(ax1,0,0,'Color','#D95319');
            if t == 0
                LW = 2;
            else
                LW = 1;
            end
            if mod(n,2) == 1 && n < 2*nft+1
                plot(ax1,x,C(1,:,n/2+1/2)+t*y,'LineWidth',LW,'Color','#0072BD')
            elseif mod(n,2) == 0 && n < 2*nft+1
                plot(ax1,x,S(1,:,n/2)+t*y,'LineWidth',LW,'Color','#D95319')
            end
            ax1.XLim = ([xa xe]);
            ax1.YLim = ([yMin yMax]);
            legend([p_funk p_ft p_c p_s],{'f(x)','\SigmaFourier-Trafo','a*cos','b*sin'},'location','NorthEast')
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
        if gstop ~= 0
            break
        end
    end
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
