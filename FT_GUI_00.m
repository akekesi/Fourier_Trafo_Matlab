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

% Last Modified by GUIDE v2.5 03-Jul-2020 01:41:45

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


function edit_xa_Callback(hObject, eventdata, handles)
% hObject    handle to edit_xa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_xa as text
%        str2double(get(hObject,'String')) returns contents of edit_xa as a double


% --- Executes during object creation, after setting all properties.
function edit_xa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_xa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_xe_Callback(hObject, eventdata, handles)
% hObject    handle to edit_xe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_xe as text
%        str2double(get(hObject,'String')) returns contents of edit_xe as a double


% --- Executes during object creation, after setting all properties.
function edit_xe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_xe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_nft_Callback(hObject, eventdata, handles)
% hObject    handle to edit_nft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_nft as text
%        str2double(get(hObject,'String')) returns contents of edit_nft as a double


% --- Executes during object creation, after setting all properties.
function edit_nft_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_nft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pb_draw1.
function pb_draw1_Callback(hObject, eventdata, handles)
% hObject    handle to pb_draw1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gstop
global gpause
gstop = 0;
gpause = 0;

funk = str2func(['@(x)',get(handles.edit_funk,'string')]);
xa = str2func(['@()',get(handles.edit_xa,'string')]);
xa = xa();
xe = str2func(['@()',get(handles.edit_xe,'string')]);
xe = xe();
nft = str2double(get(handles.edit_nft,'string'));

T = xe-xa;
dt = T/100;
x = xa:dt:xe;
[~,~,~,~,~,F] = FT_GUI_Fourier_Trafo(funk,nft,x);

ymax = max(F(1,:,end));
if ymax < 0 
    yMax = 0;
else
    yMax = ymax+abs(fix(ymax*5)/10);
end
ymin = min(F(1,:,end));
if ymin > 0 
    yMin = 0;
else
    yMin = ymin-abs(fix(ymin*5)/10);
end
xmax = max(F(2,:,end));
xmin = min(F(2,:,end));
xMax = max(xmax,abs(xmin));
O = -fix(xMax*15)/10;
ax1 = handles.axes1;
tmp = 0;
while gstop == 0
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
        hold(ax1,'off')
        while gpause ~= 0
            uiwait
        end
        if gstop ~= 0
            break
        end
    end
    tmp = 1;
end


% --- Executes on button press in pb_draw2.
function pb_draw2_Callback(hObject, eventdata, handles)
% hObject    handle to pb_draw2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gstop
global gpause
gstop = 0;
gpause = 0;

funk = str2func(['@(x)',get(handles.edit_funk,'string')]);
xa = str2func(['@()',get(handles.edit_xa,'string')]);
xa = xa();
xe = str2func(['@()',get(handles.edit_xe,'string')]);
xe = xe();
nft = str2double(get(handles.edit_nft,'string'));

T = xe-xa;
dt = T/100;
x = xa:dt:xe;
[~,~,S,C,CS,~] = FT_GUI_Fourier_Trafo(funk,nft,x);

ymaxs = max(S(1,:,:),[],'all');
ymaxc = max(C(1,:,:),[],'all');
ymax = max(max(ymaxs,ymaxc),max(CS(end,:)));
if ymax < 0 
    yMax = 0;
else
    yMax = ymax+abs(fix(ymax*5)/10);
end

ymins = min(S(1,:,:),[],'all');
yminc = min(C(1,:,:),[],'all');
ymin = min(min(ymins,yminc),min(CS(end,:)));
if ymin > 0 
    yMin = 0;
else
    yMin = ymin-abs(fix(ymin*5)/10);
end
y = yMax/100;

ax2 = handles.axes2;
while gstop == 0
    for n = 1:1:2*nft+1
        for t = 100:-1:0
            p_funk = plot(ax2,x,funk(x),'Color','#77AC30');
            hold(ax2,'on')
            p_ft = plot(ax2,x,CS(n,:),'LineWidth',1.5,'Color','k');
            p_c = plot(ax2,0,0,'Color','#0072BD');
            p_s = plot(ax2,0,0,'Color','#D95319');
            if t == 0
                LW = 2;
            else
                LW = 1;
            end
            if mod(n,2) == 1 && n < 2*nft+1
                plot(ax2,x,C(1,:,n/2+1/2)+t*y,'LineWidth',LW,'Color','#0072BD')
            elseif mod(n,2) == 0 && n < 2*nft+1
                plot(ax2,x,S(1,:,n/2)+t*y,'LineWidth',LW,'Color','#D95319')
            end
            ax2.XLim = ([xa xe]);
            ax2.YLim = ([yMin yMax]);
            legend([p_funk p_ft p_c p_s],{'f(x)','\SigmaFourier-Trafo','a*cos','b*sin'},'location','NorthEast')
            ax2.XAxisLocation = 'origin';
            ax2.YAxisLocation = 'origin';
            grid(ax2,'on')
            grid(ax2,'minor')
            ax2.DataAspectRatio = ([1 1 1]);
            drawnow
            if t == 0
                pause(2)
            end
            hold(ax2,'off')
            while gpause ~= 0
                uiwait
            end
            if gstop ~= 0
                break
            end
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
global gstop
gstop = 1;


% --- Executes on button press in pb_clear.
function pb_clear_Callback(hObject, eventdata, handles)
% hObject    handle to pb_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1)


% --- Executes on button press in pb_info.
function pb_info_Callback(hObject, eventdata, handles)
% hObject    handle to pb_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pb_close.
function pb_close_Callback(hObject, eventdata, handles)
% hObject    handle to pb_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
