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
use Stevebauman\Purify\Facades\Purify;

class BlogController extends Controller
{
    use Upload;


    public function category()
    {
        $data['page_title'] = 'Blog Category List';
        return view('admin.blog.category', $data);
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
        $result = BlogCategory::create($excp);
        if ($result) {
            return [
                'status' => 'success',
                'message' => 'Saved Successfully',
                'data' => $result
            ];
        } else {
            return [
                'status' => 'error',
                'message' => 'failed!!!',
                'data' => []
            ];
        }
    }

    public function updateCategory(Request $request)
    {
        $excp = Purify::clean($request->except('_token', '_method'));
        $rules = [
            'id' => 'required|numeric',
            'title' => 'required|max:191',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->messages()], 422);
        }
        $in['title'] = $excp['title'];
        $result = BlogCategory::findOrFail($request['id'])->update($in);
        if ($result) {
            return [
                'status' => 'success',
                'message' => 'Update Successfully',
                'data' => $result
            ];
        } else {
            return [
                'status' => 'error',
                'message' => 'Updating Failed',
                'data' => []
            ];
        }
    }

    public function destroyCategory(Request $request)
    {
        $excp = Purify::clean($request->except('_token', '_method'));
        $rules = ['id' => 'required'];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->messages()], 422);
        }
        $result = BlogCategory::destroy($excp['id']);
        if ($result) {
            return [
                'status' => 'success',
                'message' => 'Delete Successfully',
                'data' => []
            ];
        } else {
            return [
                'status' => 'error',
                'message' => 'Failed!!',
                'data' => []
            ];
        }
    }



    public function index()
    {
        $data['methods'] = Blog::with('category')->latest()->paginate(20);
        $data['page_title'] = 'Blog';
        return view('admin.blog.index', $data);
    }

    public function create()
    {
        $data['page_title'] = 'Add Blog';
        $data['categories'] = BlogCategory::all();
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
            $data->description = $request->description;
            $data->status = $request->status;
            $res = $data->save();
            if (!$res) {
                throw new \Exception('Unexpected error! Please try again.');
            }

            return back()->with('success', 'Blog data has been updated.');

        } catch (\Exception $exception) {
            return back()->with('error', $exception->getMessage());
        }

    }

    public function edit($id)
    {
        $data['method'] = Blog::findOrFail($id);
        $data['categories'] = BlogCategory::all();
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


        $data = Blog::findOrFail($id);

        $this->validate($request, $rules);
        if ($request->hasFile('image')) {
            try {
                $old = $data->image ?? null;
                $data->image = $this->uploadImage($request->image, config('location.blog.path'), config('location.blog.size'), $old);
            } catch (\Exception $exp) {
                return back()->with('error', 'Image could not be uploaded.');
            }
        }


        try {
            $data->name = $request->name;
            $data->category_id = $request->category_id;
            $data->description = $request->description;
            $data->status = $request->status;
            $res = $data->save();

            if (!$res) {
                throw new \Exception('Unexpected error! Please try again.');
            }
            return back()->with('success', 'Blog data has been updated.');

        } catch (\Exception $exception) {
            return back()->with('error', $exception->getMessage());
        }

    }

    public function delete($id)
    {
        $data = Blog::findOrFail($id);
        $this->removeFile(config('location.blog.path').$data->image);
        $this->removeFile(config('location.blog.path') . '/thumb_' . $data->image);
        $data->delete();
        return back()->with('success', 'Blog data has been deleted.');
    }



}
