import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final String movie= 
    ModalRoute.of(context)?.settings.arguments.toString() ?? 
    'Sin nombre';
    return const Scaffold(
      body: CustomScrollView(
        //widget con comportamiento definido alm scroll
        slivers: [_CustomAppBar(),
        SliverList(delegate: SliverChildListDelegate.fixed([
          _PosterAndTitle(),
          _Overview(),
          _ActoresSlider(),
        ])
        )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color.fromARGB(255, 0, 255, 221),
      expandedHeight: 100,
      floating: false,
      pinned: true,
      //widget para que se ajuste al tamaño
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        //eliminar pading
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text('movie.title',
          style: TextStyle(fontSize: 18),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('assets/loading.gif'),
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: AssetImage('assets/no-image.jpg'),
              height: 200,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title',
              style: TextStyle(fontSize: 30),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              ),
              Text(
                'movie.titleOriginal',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              ),
              Row(
                children: [
                  Icon(
                    Icons.start_outlined,
                    size: 20,
                    color: const Color.fromARGB(255, 0, 255, 8),
                  ),
                  SizedBox(width: 5),
                  Text(
                'movie.voteAverage',
                   style: TextStyle(fontSize: 18),
                   textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                   maxLines: 2,
              ),
                ],
              )
            ],
          )
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20, 
        vertical: 10,
      ),
      child: Text('Deserunt ut ut cupidatat tempor aute quis pariatur qui veniam ea excepteur duis do. Qui deserunt dolore in consequat tempor cillum sint sunt esse nostrud culpa. Cupidatat mollit amet consequat cillum ea cupidatat. Lorem adipisicing culpa est mollit occaecat mollit. Culpa elit est ullamco reprehenderit elit culpa dolore ut occaecat laboris dolore dolore.',
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 15),
      ),
    );
  }
}

class _ActoresSlider extends StatelessWidget {
  const _ActoresSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.30,
      color: Color.fromARGB(255, 187, 255, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'ACTORES:',
             style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
            ),
            ),
            Expanded(child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:20,
              itemBuilder: (_, int index) => _ActoresPoster(),
            ))
        ],
      ),
    );
  }
}

class _ActoresPoster extends StatelessWidget {
  const _ActoresPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
           // onTap: () => Navigator.pushNamed(context, 'details', arguments: ''),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: AssetImage('assets/no-image.jpg'),
                width: 130,
                height: 165,
                ),
              ),
          ),
          const SizedBox(height: 5),
          const Text(
            'In tempor dolor velit eu est cillum cillum nisi incididunt quis irure.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

