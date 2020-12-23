import 'package:flutter/material.dart';
import 'package:photo/src/entity/options.dart';
import 'package:photo/src/provider/i18n_provider.dart';
import 'package:photo_manager/photo_manager.dart';

class ChangeGalleryDialog extends StatefulWidget {
  final List<AssetPathEntity> galleryList;
  final I18nProvider i18n;
  final Options options;

  const ChangeGalleryDialog({
    Key key,
    this.galleryList,
    this.i18n,
    this.options,
  }) : super(key: key);

  @override
  _ChangeGalleryDialogState createState() => _ChangeGalleryDialogState();
}

class _ChangeGalleryDialogState extends State<ChangeGalleryDialog> {
  @override
  Widget build(BuildContext context) {
    return
   Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: ListTile(
            title: Text("Select Folder"),
            trailing: IconButton(
              icon:Icon(Icons.clear,color:Color(0xfffa00dd)),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          color: Colors.white, 
        ),
        Expanded(
          child:Container(
          child: Padding(
              child: Container(
                child:
                ListView.builder(
                  //shrinkWrap: true,
                  itemBuilder: _buildItem,
                  itemCount: widget.galleryList.length,
                  ),
                
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              )

            ),
            padding: EdgeInsets.all(8.0),
          ),
          color: Colors.grey[100],
        ) ,
        )
        
        
      ],
    );
    
  }

  Widget _buildItem(BuildContext context, int index) {
    var entity = widget.galleryList[index];
    String text;

    if (entity.isAll) {
      text = widget.i18n?.getAllGalleryText(widget.options);
    }

    text = text ?? entity.name;

    return 
    Column(
      children: [
        FlatButton(
          child: ListTile(
            leading:Icon(
              text.toLowerCase()=="recent"?Icons.backup_outlined:
              text.toLowerCase().contains("download")?Icons.download_rounded:
              text.toLowerCase().contains("screenshot")?Icons.picture_in_picture:
              Icons.image_aspect_ratio_outlined,
              color: Colors.black,
              
            ) ,
            title: Text("$text (${entity.assetCount})"),
          ),
          onPressed: () {
            Navigator.pop(context, entity);
          },
        ),
        Divider(thickness: 1,)
      ],
    );
    ;
  }
}
