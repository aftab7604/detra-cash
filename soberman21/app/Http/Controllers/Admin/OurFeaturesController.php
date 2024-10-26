<?php

namespace App\Http\Controllers\Admin;
use App\Models\OurFeature;
use App\Models\Language;
use App\Http\Traits\Upload;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
class OurFeaturesController extends Controller
{

    use Upload;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $OurFeature = OurFeature::where('parent_id',NULL)->get();
        return view('admin.ourFeature.index', compact('OurFeature'));
    }
    public function ourFeatureList()
    {
        // $OurFeature = OurFeature::all();
        $OurFeature = 'hi';
        return view('themes.minimal.sections.our-features', compact('OurFeature'));
    }


    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            'description' => 'required',
        ]);

        $imageName = $this->uploadImage($request->image, config('location.blog.path'), config('location.blog.size'), null, config('location.thumb.size'));

        OurFeature::create([
            'title' => $request->title,
            'language_id' => 1,
            'image' => $imageName,
            'description' => $request->description,
        ]);

        return redirect()->route('admin.ourFuture.index')->with('success','Our Future created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        // dd('df');
        $ourFuture = OurFeature::find($id);
        $languages 			= Language::all();
        return view('admin.ourFeature.edit', compact('ourFuture','languages'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'title' => 'required',
            'description' => 'required',
        ]);

        if($id==0){
            OurFeature::create([
                'title' => $request->title,
                'image' => $request->image,
                'language_id' => $request->language_id,
                'parent_id' => $request->f_id,
                'description' => $request->description,
            ]);
        }
        else{
            $OurFeature = OurFeature::findOrFail($id);

            // If a new image is uploaded, delete the previous image
            if ($request->hasFile('image')) {
                $imageName = $this->uploadImage($request->image, config('location.blog.path'), config('location.blog.size'), null, config('location.thumb.size'));
                $OurFeature->image = $imageName;
            }
    
            $OurFeature->title = $request->title;
            $OurFeature->description = $request->description;
            $OurFeature->save();
        }

        return redirect()->route('admin.ourFuture.index')->with('success','Our Future updated successfully');

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $OurFeature = OurFeature::findOrFail($id);

        DB::table('our_features')->where('parent_id', $id)->delete();

        // Delete associated image file
        if (file_exists(public_path('images/' . $OurFeature->image))) {
            unlink(public_path('images/' . $OurFeature->image));
        }

        $OurFeature->delete();

        return redirect()->route('admin.ourFuture.index')->with('success','Our Future deleted successfully');
    }
}
