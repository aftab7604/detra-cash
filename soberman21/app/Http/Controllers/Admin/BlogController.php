<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\Upload;
use App\Models\Blog;
use App\Models\BlogCategory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\Models\Language;
use Stevebauman\Purify\Facades\Purify;

class BlogController extends Controller
{
    use Upload;


    public function category()
    {
    	$languages = Language::all();
    	$data['methods'] = BlogCategory::where('language_id',1)->latest()->paginate(20);
    	$data['languages'] = $languages;
        $data['page_title'] = 'Blog Category List';
        
        return view('admin.blog.category', $data);
    }
    
    public function categoryadd()
    {
    	$languages = Language::all();
    	$data['languages'] = $languages;
        $data['page_title'] = 'Blog Category Add';
        
        return view('admin.blog.create-category', $data);
    }
    
    public function editcategory($id)
    {
    	$languages 			= Language::all();
    	$data['languages'] 	= $languages;
        $data['page_title'] = 'Blog Category Edit';
        $data['method'] = BlogCategory::findOrFail($id);
        //return view('admin.blog.edit', $data);
        
        return view('admin.blog.edit-category', $data);
    }

    public function getCategory()
    {
        $items = BlogCategory::orderBy('id', 'desc')->get();
        
        return $items;
    }

    public function storeCategory(Request $request)
    {
    	
        $excp = Purify::clean($request->except('_token', '_method'));
        $rules = [
            'title' => 'sometimes|required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->messages()], 422);
        }
        $data = new BlogCategory();
        $data->title = $request->title;
        $data->language_id = $request->language_id;
        $data->parent_id = 0;
        
        $result = $data->save();
        //$result = BlogCategory::create($excp);
        if ($result) {
            log_admin_activity('New blog category', 'Added a new blog category ('.$request->title.')');
            return back()->with('success', 'Saved Successfully');
            
        } else {
            return back()->with('error', 'Some Thing Went Wrong');
        }
    }

    public function updateCategory(Request $request,$id)
    {
    	
    	$rules = [
            
            'title' => 'required|max:191',
        ];
        $this->validate($request, $rules);
        
    	$child_category = BlogCategory::where(['parent_id' => $id,'language_id' => $request->language_id])->first(); 
        $in['title'] = $request->title;
        if($child_category)
        {
        	
        	$result = BlogCategory::findOrFail($request->request_id)->update($in);
        	
        }else
        {
        	if($request->language_id == 1)
        	{
        		$result = BlogCategory::findOrFail($id)->update($in);
        	}else
        	{
        		$data = new BlogCategory();
        		$data->title = $request->title;
	            $data->language_id = $request->language_id;
	            $data->parent_id = $id;
	            $result = $data->save();
        	}
        	
        }
        
        
        
        if ($result) {
            log_admin_activity('Update category', 'Updated blog category ('.$request->title.')');
        	return redirect()->route('admin.blog.category')->with('success', 'Category data has been Updated.');
        } else {
            return back()->with('error', 'Data Can\'t be updated!');
        }
    }

    public function destroycategory($id)
    {
    	
    	$data = BlogCategory::findOrFail($id);
    	$data->delete();
        log_admin_activity('Delete blog category', 'Deleted blog category ('.$data->title.')');
    	return redirect()->route('admin.blog.category')->with('success', 'Category data has been deleted.');
       // return back()->with('success', 'Category data has been deleted.');
        
    }



    public function index()
    {
        $data['methods'] = Blog::where('language_id',1)->with('category')->latest()->paginate(20);
        $data['page_title'] = 'Blog';
        return view('admin.blog.index', $data);
    }

    public function create()
    {
        $data['page_title'] = 'Add Blog';
        $data['categories'] = BlogCategory::where('parent_id',0)->get();
        
        return view('admin.blog.create', $data);
    }

    public function store(Request $request)
    {
        $rules = [
            'category_id' => 'required',
            'name' => 'required',
            'description' => 'required',
        ];
        $this->validate($request, $rules);
        $data = new Blog();
        if ($request->hasFile('image')) {
            try {
                $data->image = $this->uploadImage($request->image, config('location.blog.path'), config('location.blog.size'), null, config('location.thumb.size'));
            } catch (\Exception $exp) {
                return back()->with('error', 'Image could not be uploaded.');
            }
        }

        try {

            $data->name = $request->name;
            $data->category_id = $request->category_id;
            $data->language_id = 1;
            $data->parent_id   = 0;
            $data->description = $request->description;
            $data->status = $request->status;
            $res = $data->save();
            if (!$res) {
                throw new \Exception('Unexpected error! Please try again.');
            }
            log_admin_activity('New blog', 'Added a new blog ('.$request->name.')');
            return back()->with('success', 'Blog data has been updated.');

        } catch (\Exception $exception) {
            return back()->with('error', $exception->getMessage());
        }

    }

    public function edit($id)
    {
        $data['method'] = Blog::findOrFail($id);
        $data['categories'] = BlogCategory::where('parent_id',0)->get();
        $data['categories_fr'] = BlogCategory::where('parent_id','!=',0)->get();
        $languages 			= Language::all();
    	$data['languages'] 	= $languages;
        $data['page_title'] = 'Edit Blog';
        return view('admin.blog.edit', $data);
    }


    public function update(Request $request, $id)
    {
        $rules = [
            'category_id' => 'required',
            'name' => 'required',
            'description' => 'required',
        ];
        $this->validate($request, $rules);
        $child_category = Blog::where(['parent_id' => $id,'language_id' => $request->language_id])->first(); 
        if($child_category)
        {
            $data = Blog::findOrFail($request->request_id);
        
            $data->name = $request->name;
            $data->category_id = $request->category_id;
            $data->description = $request->description;
            $data->status = 1;
            $res = $data->save();
        }else
        {
            if($request->language_id == 1)
            {
                
                $data = Blog::findOrFail($id);
                if ($request->hasFile('image')) {
                    try {
                        $old = $data->image ?? null;
                        $data->image = $this->uploadImage($request->image, config('location.blog.path'), config('location.blog.size'), $old);
                    } catch (\Exception $exp) {
                        return back()->with('error', 'Image could not be uploaded.');
                    }
                }
                $data->name = $request->name;
                $data->category_id = $request->category_id;
                $data->description = $request->description;
                $data->status = $request->status;
                $res = $data->save();
            }else
            {
                $data = new Blog();
                $data->name 		= $request->name;
                $data->category_id 	= $request->category_id;
                $data->description 	= $request->description;
                $data->status 		= 1;
                $data->image		= $request->image;
                $data->language_id	= $request->language_id;
                $data->parent_id	= $request->id;
                $res = $data->save();
            }
            
        }
        if (!$res) {
            throw new \Exception('Unexpected error! Please try again.');
        }
        log_admin_activity('Update blog', 'Updated blog ('.$request->name.')');
        return back()->with('success', 'Blog data has been updated.');
    }

    public function delete($id)
    {
        $data = Blog::findOrFail($id);
        $this->removeFile(config('location.blog.path').$data->image);
        $this->removeFile(config('location.blog.path') . '/thumb_' . $data->image);
        $data->delete();
        log_admin_activity('Delete blog', 'Deleted blog ('.$data->name.')');
        return back()->with('success', 'Blog data has been deleted.');
    }



}
