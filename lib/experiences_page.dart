import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_app/experience_form.dart';
import 'package:personal_app/model/experience_model.dart';
import 'package:personal_app/repository/experience_repository.dart';

class ExperiencesPage extends StatefulWidget {
  const ExperiencesPage({super.key});

  @override
  State<ExperiencesPage> createState() => _ExperiencesPageState();
}

class _ExperiencesPageState extends State<ExperiencesPage>
    with TickerProviderStateMixin {
  bool showFAB = true;
  late ExperienceRepository experiencesRepo;

  late final _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400))
    ..forward();

  late final _animation =
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _animation.dispose();
  }

  @override
  void initState() {
    super.initState();
    experiencesRepo = ExperienceRepository();
  }

  showExperienceDetails(ExperienceModel experience) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ExperienceForm(experience: experience)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ExperienceForm()));
          },
          icon: const Icon(Icons.add),
          label: const Text('Nova experiência'),
        ),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, __) => [
          const SliverAppBar(
            title: Text("Minhas Experiências"),
            snap: true,
            floating: true,
          ),
        ],
        body: AnimatedBuilder(
            animation: experiencesRepo,
            builder: (context, child) {
              final experiences = experiencesRepo.experiences;

              return (experiences.isEmpty)
                  ? const Center(child: CircularProgressIndicator())
                  : NotificationListener<UserScrollNotification>(
                      onNotification: (scroll) {
                        if (scroll.direction == ScrollDirection.reverse &&
                            showFAB) {
                          _controller.reverse();
                          showFAB = false;
                        } else if (scroll.direction ==
                                ScrollDirection.forward &&
                            !showFAB) {
                          _controller.forward();
                          showFAB = true;
                        }
                        return true;
                      },
                      child: ListView.separated(
                        itemCount: experiences.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child:
                                Image.network(experiences[index].description),
                          )),
                          title: Text(experiences[index].position),
                          onTap: () =>
                              showExperienceDetails(experiences[index]),
                        ),
                        separatorBuilder: (_, __) => const Divider(),
                      ),
                    );
            }),
      ),
    );
  }
}
