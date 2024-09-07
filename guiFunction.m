function varargout = guiFunction(varargin)
% GUIFUNCTION MATLAB code for guiFunction.fig
%      GUIFUNCTION, by itself, creates a new GUIFUNCTION or raises the existing
%      singleton*.
%
%      H = GUIFUNCTION returns the handle to a new GUIFUNCTION or the handle to
%      the existing singleton*.
%
%      GUIFUNCTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIFUNCTION.M with the given input arguments.
%
%      GUIFUNCTION('Property','Value',...) creates a new GUIFUNCTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiFunction_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiFunction_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiFunction

% Last Modified by GUIDE v2.5 29-Aug-2024 20:14:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiFunction_OpeningFcn, ...
                   'gui_OutputFcn',  @guiFunction_OutputFcn, ...
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


% --- Executes just before guiFunction is made visible.
function guiFunction_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiFunction (see VARARGIN)

% Choose default command line output for guiFunction
handles.output = hObject;
handles.flag = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiFunction wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiFunction_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in findPath.
function findPath_Callback(hObject, eventdata, handles)
% hObject    handle to findPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.im_roads,~] = mainFunction(handles.im_original, str2double(get(handles.edit1, 'String')), str2double(get(handles.edit2, 'String')));
handles.flag = 1;
guidata(hObject, handles); 
axes(handles.result) %active axes2 to show result
colormap gray
imagesc(handles.im_roads);
axis off


% --- Executes on button press in Load.
function Load_Callback(hObject, eventdata, handles)
% hObject    handle to Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file_name, path_name]=uigetfile('*');
full_path=[path_name '\' file_name];
[handles.path_name]=path_name;
handles.file_name=file_name;
handles.im_original=imread(full_path); % read the image
guidata(hObject,handles); % To save changes in the handles object
axes(handles.input); %active axes1 to show images
colormap gray
imagesc(handles.im_original);
axis off

% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
user_response = handles.flag;
switch user_response
    case {0}
	    % take no action
    case {1}
	    % Prepare to restart GUI application window
        [filename, pathname]=uiputfile([handles.path_name,'/*.*'],'Save as');
        full=[pathname '\' filename];
        guidata(hObject, handles); % To save changes in handle object
        imwrite(handles.im_roads,[full,'.jpg'],'JPEG');
    case {2}
	    % Prepare to restart GUI application window
        [filename, pathname]=uiputfile([handles.path_name,'/*.*'],'Save as');
        full=[pathname '\' filename];
        guidata(hObject, handles); % To save changes in handle object
        imwrite(handles.BW,[full,'.jpg'],'JPEG');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function input_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to input (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB


% --- Executes on button press in BW_Path.
function BW_Path_Callback(hObject, eventdata, handles)
% hObject    handle to BW_Path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[~, handles.BW] = mainFunction(handles.im_original, str2double(get(handles.edit1, 'String')), str2double(get(handles.edit2, 'String')));
handles.flag=2;
guidata(hObject, handles); 
axes(handles.result) %active axes2 to show result
colormap gray
imagesc(handles.BW);
axis off
